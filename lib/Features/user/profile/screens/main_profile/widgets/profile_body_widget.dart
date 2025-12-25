import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../../core/constants/icons.dart';
import '../../../../../../data/models/user_model.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final ImageProvider imageSource;

  const ProfileSectionWidget({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.imageSource,
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
            backgroundImage: imageSource,
            child:
                imageSource == const AssetImage('assets/images/appprofile.jpg')
                ? const Icon(Icons.person, size: 50, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 10),
          Text(name, style: AppTextStyles.heading1Bold),
          Text(phoneNumber, style: AppTextStyles.heading2Regular),
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
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class ProfileBodyWidget extends StatelessWidget {
  final UserModel? user;
  final bool isDarkTheme;
  final bool isEnglish;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<bool> onLanguageChanged;
  final Function(String) onNavigate;
  final VoidCallback onSignOut;

  const ProfileBodyWidget({
    super.key,
    required this.user,
    required this.isDarkTheme,
    required this.isEnglish,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.onNavigate,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final fullName = (user?.firstName != null && user!.lastName != null)
        ? '${user!.firstName} ${user!.lastName}'
        : (user?.name ?? 'Loading Profile...');

    final phoneNumber = user != null ? user!.phone : '...';

    final imagePath = user?.avatarUrl?.isNotEmpty == true
        ? user!.avatarUrl!
        : 'assets/images/appprofile.jpg';

    final isNetworkImage = user?.avatarUrl?.isNotEmpty == true;
    final ImageProvider profileImage = isNetworkImage
        ? NetworkImage(imagePath)
        : AssetImage(imagePath) as ImageProvider;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileSectionWidget(
                name: fullName,
                phoneNumber: phoneNumber,
                imageSource: profileImage,
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
