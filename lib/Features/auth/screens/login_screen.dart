import 'package:flutter/material.dart';
import 'package:mabeet/Features/auth/screens/create_account_screen.dart';

import '../../../core/theme/app_colors.dart';
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

  void _goToSignup(BuildContext ctx) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountScreen()),
    );
  }

  void _sendForm(){
    if (_formKey.currentState!.validate()) {

    }
  }

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
                Text('Welcome Back!', style: AppTextStyles.display2Bold),
                Text(
                  'Sign in with your phone number to continue',
                  style: AppTextStyles.bodyMedium,
                ),
                SizedBox(height: 60),
                Text('Phone Number', style: AppTextStyles.titleMedium),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: '963 *** *** ***'),
                  initialValue: _phoneNumber,
                  onSaved: (val) {
                    _phoneNumber = val!;
                  },
                  maxLength: 12,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length != 12)
                      return 'Enter a vailid phone number';
                    else
                      return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Password', style: AppTextStyles.titleMedium),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'enter your password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: passwordVisible,
                  initialValue: _password,
                  onSaved: (val) {
                    _password = val!;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 5)
                      return 'Must be at least 6 characters';
                    else
                      return null;
                  },
                ),
                SizedBox(height: 164),
                AuthButton(buttonsText: 'Login', onBtnPressed: _sendForm),
                SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ? '),
                      InkWell(
                        onTap: () {
                          _goToSignup(context);
                        },
                        child: Text(
                          'Create Account',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.primary700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
