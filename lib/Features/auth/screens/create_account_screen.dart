import 'package:flutter/material.dart';
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

  String _phoneNumber = '';
  String _name = '';
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
                Text('Create Account', style: AppTextStyles.display2Bold),

                Text(
                  'Sign in with your phone number to continue',
                  style: AppTextStyles.bodyMedium,
                ),
                SizedBox(height: 60),
                Text('Phone Number', style: AppTextStyles.titleMedium),
                TextFormField(
                  buildCounter:
                      (
                        BuildContext context, {
                        required int currentLength,
                        required int? maxLength,
                        required bool isFocused,
                      }) => null,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '963 *** *** ***',
                    helperText: ' ',
                  ),
                  initialValue: _phoneNumber,
                  onSaved: (val) {
                    _phoneNumber = val!;
                  },

                  maxLength: 12,
                  validator: _validatePhone,
                ),
                Text('User Name', style: AppTextStyles.titleMedium),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    helperText: ' ',
                  ),
                  initialValue: _name,
                  onSaved: (val) {
                    _name = val!;
                  },
                  validator: _validateName,
                ),
                Text('Password', style: AppTextStyles.titleMedium),
                TextFormField(
                  decoration: _passwordDecoration(),
                  validator: _validatePassword,
                  obscureText: passwordVisible,
                  initialValue: _password,
                  onSaved: (val) {
                    _password = val!;
                  },
                ),
                SizedBox(height: 10),
                AgreeTerms(),
                SizedBox(height: 20),
                AuthButton(buttonsText: 'Sign up', onBtnPressed: _sendForm),
                SizedBox(height: 40),
                SwitchScreenText(
                  txt: 'already have an account?',
                  onPressed: _goToLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _passwordDecoration() {
    return InputDecoration(
      hintText: 'at least 6 characters !',
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
    if (value == null || value.isEmpty || value.trim().length != 12)
      return 'Enter a vailid phone number';
    else
      return null;
  }

  String? _validateName(value) {
    if (value == null || value.isEmpty)
      return 'Enter your name';
    else
      return null;
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty || value.trim().length <= 5)
      return 'Must be at least 6 characters';
    else
      return null;
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _sendForm() {
    if (_formKey.currentState!.validate()) {}
  }
}
