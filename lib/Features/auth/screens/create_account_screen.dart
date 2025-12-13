import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import '../services/cubit/user_cubit.dart';
import '../services/cubit/user_state.dart';
import 'login_screen.dart';
import '../widgets/agree_terms.dart';
import '../widgets/auth_button.dart';
import '../widgets/switch_screen_text.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/text_styles.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool _termsAgreed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Account Created Successfully')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.error700,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(AppImages.kLogoPath, width: 70)),
                    Text('Create Account', style: AppTextStyles.display2Bold),
                    Text(
                      'Enter your credentials to start the experience!',
                      style: AppTextStyles.bodyMedium,
                    ),
                    SizedBox(height: 60),
                    Text('User Name', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpName,
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        helperText: ' ',
                      ),
                      validator: _validateName,
                    ),
                    Text('Phone Number', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpPhone,
                      buildCounter:
                          (
                            BuildContext context, {
                            required int currentLength,
                            required int? maxLength,
                            required bool isFocused,
                          }) => null,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '09 ** *** ***',
                        helperText: ' ',
                      ),
                      maxLength: 10,
                      validator: _validatePhone,
                    ),
                    Text('Email', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpEmail,
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        helperText: ' ',
                      ),
                      validator: _validateEmail,
                    ),
                    Text('Password', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpPassword,
                      decoration: _passwordDecoration(),
                      validator: _validatePassword,
                      obscureText: passwordVisible,
                    ),
                    Text('Confirm Password', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context
                          .read<UserCubit>()
                          .signUpPasswordConfirmation,
                      decoration: _passwordDecoration(),
                      validator: (val) => _validateConfirmPassword(
                        val,
                        context.read<UserCubit>().signUpPassword.text,
                      ),
                      obscureText: passwordVisible,
                    ),
                    SizedBox(height: 10),
                    AgreeTerms(onTermsChanged: _handleTermsChange),
                    SizedBox(height: 20),
                    state is SignUpLoading
                        ? CircularProgressIndicator()
                        : AuthButton(
                            buttonsText: 'Sign up',
                            onBtnPressed: _sendForm,
                          ),
                    SizedBox(height: 40),
                    SwitchScreenText(
                      txt: 'already have an account? ',
                      logOrSign: 'LogIn',
                      onPressed: _goToLogin,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _passwordDecoration() {
    return InputDecoration(
      hintText: 'at least 8 characters !',
      helperText: ' ',
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }

  String? _validatePhone(value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    final phoneRegExp = RegExp(r'^09[0-9]{8}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number starting with 09.';
    }
    return null;
  }

  String? _validateName(value) {
    if (value == null || value.isEmpty)
      return 'Enter your name';
    else
      return null;
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    const pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).+$';
    final passwordRegExp = RegExp(pattern);
    if (!passwordRegExp.hasMatch(value)) {
      return 'Must include: uppercase, lowercase, number, and special character.';
    }
    return null;
  }

  void _goToLogin() {
    _formKey.currentState!.reset();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _sendForm() async {
    if (_formKey.currentState!.validate()) {
      if (_termsAgreed) {
        await context.read<UserCubit>().signUp();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Terms Not Agreed!!!')));
      }
    }
  }

  void _handleTermsChange(bool newValue) {
    setState(() {
      _termsAgreed = newValue;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final emailRegExp = RegExp(pattern);

    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  String? _validateConfirmPassword(String? val, String text) {
    if (val != text)
      return 'Must be same as password';
    else
      return null;
  }
}
