import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/screens/login_screen.dart';
import 'package:mabeet/Features/auth/services/cubit/user_cubit.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/widgets/profile_body_skeleton.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/core/widgets/CustomAppBar.dart';
import 'package:mabeet/core/widgets/internet_error_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/localization/localiztion_service.dart';
import '../../About us/screens/about_us_screen.dart';
import '../../Editprofile/screens/edit_profile_screen.dart';
import '../widgets/profile_body_widget.dart';
import '../../../../../../core/theme/bloc/theme_state.dart';
import '../../../../../../core/theme/bloc/theme_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final isDark = themeState.themeMode == ThemeMode.dark;
        bool isEnglish =
            LocalizationService.getCurrentLanguageCode(context) == 'en';

        return Scaffold(
          appBar: CustomAppBar(titleText: AppStrings.profileScreenTitle.tr()),
          body: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is ProfileCreationRequired) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        const EditProfileScreen(isCreationMode: true),
                  ),
                );
              } else if (state is CreateProfileSuccess) {
                context.read<UserCubit>().getUserProfile();
              }
            },
            builder: (context, userState) {
              final userCubit = context.read<UserCubit>();
              if (userState is GetUserLoading) {
                return Shimmer.fromColors(
                  baseColor: AppColors.gray300,
                  highlightColor: AppColors.gray100,
                  child: const ProfileBodySkeleton(),
                );
              }

              if (userState is GetUserFailure) {
                if (userCubit.currentUser == null) {
                  return InternetErrorWidget(message: AppStrings.errorMessage.tr(), onRetry: userCubit.getUserProfile,);
                }
              }
              return ProfileBodyWidget(
                profile: userCubit.currentProfile,
                isDarkTheme: isDark,
                isEnglish: isEnglish,
                onThemeChanged: (val) => _handleThemeChange(),
                onLanguageChanged: (val) => _handleLanguageChange(val),
                onNavigate: _navigateTo,
                onSignOut: _signOut,
              );
            },
          ),
        );
      },
    );
  }

  void _handleLanguageChange(bool isEnglish) async {
    final screenContext = context;
    showDialog(
      context: screenContext,
      barrierDismissible: false,
      builder: (context) {
        final currentLocale = LocalizationService.getCurrentLanguageCode(
          context,
        );
        final nextLocaleName = (currentLocale == 'en')
            ? AppStrings.localeArabic.tr()
            : AppStrings.localeEnglish.tr();

        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Text('${AppStrings.localeChangingTo.tr()} $nextLocaleName'),
            ],
          ),
        );
      },
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      Navigator.of(screenContext, rootNavigator: true).pop();
    }
    if (mounted) {
      LocalizationService.switchLanguage(context);
      isEnglish = LocalizationService.getCurrentLanguageCode(context) == 'en';
    }
  }

  void _handleThemeChange() async {
    final themeBloc = context.read<ThemeCubit>();
    final screenContext = context;
    showDialog(
      context: screenContext,
      barrierDismissible: false,
      builder: (context) {
        final currentThemeMode = themeBloc.state.themeMode;
        final nextThemeName = (currentThemeMode == ThemeMode.dark)
            ? AppStrings.themeLight.tr()
            : AppStrings.themeDark.tr();

        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Text('${AppStrings.themeChangingTo.tr()} $nextThemeName'),
            ],
          ),
        );
      },
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      Navigator.of(screenContext, rootNavigator: true).pop();
    }
    if (mounted) {
      themeBloc.toggleTheme();
    }
  }

  void _navigateTo(String title) {
    Widget screen;
    switch (title) {
      case 'Edit Profile':
        screen = const EditProfileScreen(isCreationMode: false);
        break;
      case 'تعديل الملف الشخصي':
        screen = const EditProfileScreen(isCreationMode: false);
        break;
      case 'About us':
        screen = const AboutUsScreen();
        break;
      case 'عنا':
        screen = const AboutUsScreen();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _signOut() {
    context.read<UserCubit>().logOut();
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
