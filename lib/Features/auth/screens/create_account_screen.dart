import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mabeet/Features/auth/screens/login_screen.dart';
import 'package:mabeet/Features/auth/widgets/auth_button.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool isChecked = false;

  String _phoneNumber = '';
  String _name = '';
  String _password = '';

  void _goToLogin(BuildContext ctx) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _sendForm() {
    if (_formKey.currentState!.validate()) {}
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
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length != 12)
                      return 'Enter a vailid phone number';
                    else
                      return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Enter your name';
                    else
                      return null;
                  },
                ),
                Text('Password', style: AppTextStyles.titleMedium),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'at least 6 characters !',
                    helperText: ' ',
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
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 5)
                      return 'Must be at least 6 characters';
                    else
                      return null;
                  },
                  obscureText: passwordVisible,
                  initialValue: _password,
                  onSaved: (val) {
                    _password = val!;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,

                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        splashRadius: 15,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Agree with',
                            style: AppTextStyles.bodyLarge,
                          ),
                          TextSpan(
                            text: ' terms',
                            style: AppTextStyles.bodyLargeSemiBold,
                          ),
                          TextSpan(
                            text: ' and',
                            style: AppTextStyles.bodyLarge,
                          ),
                          TextSpan(
                            text: ' privacy',
                            style: AppTextStyles.bodyLargeSemiBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AuthButton(buttonsText: 'Sign up', onBtnPressed: _sendForm),
                SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ? '),
                      InkWell(
                        onTap: () {
                          _goToLogin(context);
                        },
                        child: Text(
                          'Login',
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
