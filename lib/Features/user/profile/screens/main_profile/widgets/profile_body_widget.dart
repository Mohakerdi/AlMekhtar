import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'profile_navigation_tile.dart';
import 'profile_section_header.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../../core/constants/icons.dart';

class ProfileBodyWidget extends StatelessWidget {
  final bool isDarkTheme;
  final bool isEnglish;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<bool> onLanguageChanged;
  final Function(String) onNavigate;
  final VoidCallback onSignOut;

  const ProfileBodyWidget({
    super.key,
    required this.isDarkTheme,
    required this.isEnglish,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.onNavigate,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ProfileSectionWidget(
                name: 'Hans Landa',
                phoneNumber: '0987654321',
                imagePath: 'assets/images/appprofile.jpg',
              ),

              const Divider(height: 30),

              SwitchListTile(
                secondary: Icon(
                  isDarkTheme ? AppIcons.darkIcon : AppIcons.lightIcon,
                  color: AppColors.primary800,
                ),
                title: Text(AppStrings.theme.tr()),
                subtitle: Text(isDarkTheme ? AppStrings.themeDark.tr() : AppStrings.themeLight.tr()),
                value: isDarkTheme,
                onChanged: onThemeChanged,
              ),
              SwitchListTile(
                secondary: const Icon(
                  AppIcons.langIcon,
                  color: AppColors.primary800,
                ),
                title: Text(AppStrings.lang.tr()),
                subtitle: Text(
                  isEnglish
                      ? AppStrings.localeEnglish.tr()
                      : AppStrings.localeArabic.tr(),
                ),
                value: isEnglish,
                onChanged: onLanguageChanged,
              ),

              const Divider(),

              ProfileNavigationTile(
                title: AppStrings.menuHistory.tr(),
                icon: AppIcons.historyIcon,
                onTap: () => onNavigate(AppStrings.menuEditProfile.tr()),
              ),
              ProfileNavigationTile(
                title: AppStrings.menuEditProfile.tr(),
                icon: AppIcons.editIcon,
                onTap: () => onNavigate(AppStrings.menuEditProfile.tr()),
              ),
              ProfileNavigationTile(
                title: AppStrings.menuAboutUs.tr(),
                icon: AppIcons.aboutUsIcon,
                onTap: () => onNavigate(AppStrings.menuAboutUs.tr()),
              ),

              const SizedBox(height: 20),

              // Sign Out Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton.icon(
                  onPressed: onSignOut,
                  icon: const Icon(AppIcons.signOutIcon),
                  label: Text(
                    AppStrings.signOutButton.tr(),
                    style: AppTextStyles.heading1MediumWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primary700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
