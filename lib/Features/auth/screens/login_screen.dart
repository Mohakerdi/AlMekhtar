import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/widgets/loading_button.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
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
      listener: (BuildContext context, state) async {
        if (state is LogInSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(AppStrings.welcomeBack.tr())));
          await Future.delayed(const Duration(milliseconds: 500));
          if (!context.mounted) return;
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
                    Text(
                      AppStrings.welcomeBack.tr(),
                      style: AppTextStyles.display2Bold,
                    ),
                    Text(
                      AppStrings.loginHeading.tr(),
                      style: AppTextStyles.bodyMedium,
                    ),
                    SizedBox(height: 60),
                    Text(
                      '${AppStrings.phone.tr()} | ${AppStrings.email.tr()}',
                      style: AppTextStyles.titleMedium,
                    ),
                    TextFormField(
                      controller: context.read<UserCubit>().logInPhone,
                      decoration: InputDecoration(
                        hintText: '09 ** | exam@gmail.com',
                        helperText: ' ',
                      ),
                    ),
                    Text(
                      AppStrings.password.tr(),
                      style: AppTextStyles.titleMedium,
                    ),
                    TextFormField(
                      controller: context.read<UserCubit>().logInPassword,
                      decoration: _passwordDecoration(),
                      obscureText: passwordVisible,
                    ),
                    SizedBox(height: 161),
                    state is LogInLoading
                        ? LoadingButton()
                        : AuthButton(
                            buttonsText: AppStrings.login.tr(),
                            onBtnPressed: _sendForm,
                          ),
                    SizedBox(height: 40),
                    SwitchScreenText(
                      txt: AppStrings.dontHaveAcc.tr(),
                      logOrSign: AppStrings.signUp.tr(),
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

  InputDecoration _passwordDecoration() {
    return InputDecoration(
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

  void _goToSignup() {
    _formKey.currentState!.reset();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountScreen()),
    );
  }

  void _sendForm() async {
    if (_formKey.currentState!.validate()) {
      await context.read<UserCubit>().logIn();
    }
  }
}
