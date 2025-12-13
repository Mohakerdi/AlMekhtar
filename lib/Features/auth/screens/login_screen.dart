import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../user/tabs.dart';
import '../../../core/theme/app_colors.dart';
import '../services/cubit/user_state.dart';
import '../services/cubit/user_cubit.dart';
import 'create_account_screen.dart';
import '../widgets/switch_screen_text.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/text_styles.dart';
import '../widgets/auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (BuildContext context, state) {
        if (state is LogInSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Welcome Back!')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Tabs()),
          );
        } else if (state is LogInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.error700,
            ),
          );
        }
      },
      builder: (BuildContext context, state) {
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
                    Text('Welcome Back!', style: AppTextStyles.display2Bold),
                    Text(
                      'Sign in with your phone number to continue',
                      style: AppTextStyles.bodyMedium,
                    ),
                    SizedBox(height: 60),
                    Text('Phone Number', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().logInPhone,
                      keyboardType: TextInputType.phone,
                      buildCounter:
                          (
                            BuildContext context, {
                            required int currentLength,
                            required int? maxLength,
                            required bool isFocused,
                          }) => null,
                      decoration: InputDecoration(
                        hintText: '09 ** *** ***',
                        helperText: ' ',
                      ),
                      maxLength: 10,
                      validator: _validatePhone,
                    ),
                    Text('Password', style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().logInPassword,
                      decoration: _passwordDecoration(),
                      obscureText: passwordVisible,
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 161),
                    state is LogInLoading
                        ? CircularProgressIndicator()
                        : AuthButton(
                            buttonsText: 'Login',
                            onBtnPressed: _sendForm,
                          ),
                    SizedBox(height: 40),
                    SwitchScreenText(
                      txt: 'Don\'t have an account? ',
                      logOrSign: 'SignUp',
                      onPressed: _goToSignup,
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

  InputDecoration _passwordDecoration() {
    return InputDecoration(
      helperText: ' ',
      hintText: 'enter your password',
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

  String? _validatePassword(value) {
    if (value == null || value.isEmpty || value.trim().length <= 7)
      return 'Must be at least 8 characters';
    else
      return null;
  }

  void _goToSignup() {
    _formKey.currentState!.reset();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountScreen()),
    );
  }

  void _sendForm() async {
    if (_formKey.currentState!.validate()) {
      await context.read<UserCubit>().LogIn();
    }
  }
}
