import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isChecked = false;

  String _phoneNumber = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
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
                        // make counter invisible
                        BuildContext context, {
                        required int currentLength,
                        required int? maxLength,
                        required bool isFocused,
                      }) => null,
                  decoration: InputDecoration(
                    hintText: '963 *** *** ***',
                    helperText: ' ',
                  ),
                  initialValue: _phoneNumber,
                  onSaved: (val) {
                    _phoneNumber = val!;
                  },
                  maxLength: 12,
                  validator: _validatephone,
                ),
                Text('Password', style: AppTextStyles.titleMedium),
                TextFormField(
                  controller: context.read<UserCubit>().logInPassword,
                  decoration: _passwordDecoration(),
                  obscureText: passwordVisible,
                  initialValue: _password,
                  onSaved: (val) {
                    _password = val!;
                  },
                  validator: _validatePassword,
                ),
                SizedBox(height: 161),
                AuthButton(buttonsText: 'Login', onBtnPressed: _sendForm),
                SizedBox(height: 40),
                SwitchScreenText(
                  txt: 'Don\'t have an account ? ',
                  onPressed: _goToSignup,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validatephone(value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length != 12)
                    return 'Enter a vailid phone number';
                  else
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
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                );
  }

  String? _validatePassword(value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 5)
                    return 'Must be at least 6 characters';
                  else
                    return null;
                }

  void _goToSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountScreen()),
    );
  }

  void _sendForm() {
    if (_formKey.currentState!.validate()) {
      context.read<UserCubit>().LogIn();
    }
  }

}
