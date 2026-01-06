import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/data/models/profile_model.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../../core/constants/icons.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String name;
  final String? avatarUrl;

  const ProfileSectionWidget({
    super.key,
    required this.name,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary500,
            child: ClipOval(
              child: avatarUrl?.isNotEmpty == true
                  ? CachedNetworkImage(
                imageUrl: avatarUrl!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const CircularProgressIndicator(color: Colors.white),
                errorWidget: (context, url, error) =>
                const Icon(AppIcons.profileIcon, size: 50, color: Colors.white),
              )
                  : const Icon(
                AppIcons.profileIcon,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: AppTextStyles.heading1Bold),
        ],
      ),
    );
  }
}

class ProfileNavigationTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileNavigationTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary800),
      title: Text(title),
      trailing: const Icon(AppIcons.profilePageArrow, size: 16),
      onTap: onTap,
    );
  }
}

class ProfileBodyWidget extends StatelessWidget {
  final ProfileModel? profile;
  final bool isDarkTheme;
  final bool isEnglish;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<bool> onLanguageChanged;
  final Function(String) onNavigate;
  final VoidCallback onSignOut;

  const ProfileBodyWidget({
    super.key,
    required this.profile,
    required this.isDarkTheme,
    required this.isEnglish,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.onNavigate,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final fullName = (profile?.firstName != null && profile!.lastName != null)
        ? '${profile!.firstName} ${profile!.lastName}'
        : 'Loading Profile...';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileSectionWidget(
                name: fullName,
                avatarUrl: profile?.avatarUrl,
              ),
              const Divider(height: 30),

              SwitchListTile(
                secondary: Icon(
                  isDarkTheme ? AppIcons.darkIcon : AppIcons.lightIcon,
                  color: AppColors.primary800,
                ),
                title: Text(AppStrings.theme.tr()),
                subtitle: Text(
                  isDarkTheme
                      ? AppStrings.themeDark.tr()
                      : AppStrings.themeLight.tr(),
                ),
                value: isDarkTheme,
                onChanged: onThemeChanged,
                inactiveTrackColor: AppColors.primary600,
              ),
              SwitchListTile(
                inactiveTrackColor: AppColors.primary600,
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
