import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
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
            SnackBar(content: Text(AppStrings.accCreatedSuccess.tr())),
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
                    Text(AppStrings.signUp.tr(), style: AppTextStyles.display2Bold),
                    Text(
                      AppStrings.createAccHeading.tr(),
                      style: AppTextStyles.bodyMedium,
                    ),
                    SizedBox(height: 60),
                    Text(AppStrings.userName.tr(), style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpName,
                      decoration: InputDecoration(
                        helperText: ' ',
                      ),
                    ),
                    Text(AppStrings.phone.tr(), style: AppTextStyles.titleMedium),
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
                    ),
                    Text(AppStrings.email.tr(), style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpEmail,
                      decoration: InputDecoration(
                        helperText: ' ',
                      ),
                    ),
                    Text(AppStrings.password.tr(), style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpPassword,
                      decoration: _passwordDecoration(),
                      obscureText: passwordVisible,
                    ),
                    Text(AppStrings.passwordConfirm.tr(), style: AppTextStyles.titleMedium),
                    TextFormField(
                      controller: context
                          .read<UserCubit>()
                          .signUpPasswordConfirmation,
                      decoration: _passwordDecoration(),
                      obscureText: passwordVisible,
                    ),
                    SizedBox(height: 10),
                    AgreeTerms(onTermsChanged: _handleTermsChange),
                    SizedBox(height: 20),
                    state is SignUpLoading
                        ? CircularProgressIndicator()
                        : AuthButton(
                            buttonsText: AppStrings.signUp.tr(),
                            onBtnPressed: _sendForm,
                          ),
                    SizedBox(height: 40),
                    SwitchScreenText(
                      txt: AppStrings.alreadyHaveAcc.tr(),
                      logOrSign: AppStrings.login.tr(),
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
      hintText: AppStrings.atLeastEight.tr(),
      helperText: ' ',
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        icon: Icon(passwordVisible ? AppIcons.visible : AppIcons.notVisible),
      ),
    );
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
        ).showSnackBar(SnackBar(content: Text(AppStrings.termsNotAgreed.tr())));
      }
    }
  }

  void _handleTermsChange(bool newValue) {
    setState(() {
      _termsAgreed = newValue;
    });
  }
}
