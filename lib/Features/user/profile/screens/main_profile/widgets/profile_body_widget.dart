import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/widgets/profile_navigation_tile.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/widgets/profile_section_header.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

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
      //padding: const EdgeInsets.all(16.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              const ProfileSectionWidget(
                name: 'Hans Landa',
                phoneNumber: '0987654321',
                imagePath: 'assets/images/appprofile.jpg',
              ),

              const Divider(height: 30),

              // Settings Section
              SwitchListTile(
                secondary: Icon(
                  isDarkTheme ? Icons.brightness_4 : Icons.brightness_7,
                  color: AppColors.primary800,
                ),
                title: const Text('Theme'),
                subtitle: Text(isDarkTheme ? 'Dark Mode' : 'Light Mode'),
                value: isDarkTheme,
                onChanged: onThemeChanged,
              ),
              SwitchListTile(
                secondary: const Icon(
                  Icons.language,
                  color: AppColors.primary800,
                ),
                title: const Text('Languages'),
                subtitle: Text(isEnglish ? 'English' : 'Arabic'),
                value: isEnglish,
                onChanged: onLanguageChanged,
              ),

              const Divider(),

              // Navigation Section
              ProfileNavigationTile(
                title: 'History',
                icon: Icons.history,
                onTap: () => onNavigate('History'),
              ),
              ProfileNavigationTile(
                title: 'Edit Profile',
                icon: Icons.edit,
                onTap: () => onNavigate('Edit Profile'),
              ),
              ProfileNavigationTile(
                title: 'About us',
                icon: Icons.info_outline,
                onTap: () => onNavigate('About us'),
              ),

              const SizedBox(height: 20),

              // Sign Out Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton.icon(
                  onPressed: onSignOut,
                  icon: const Icon(Icons.logout),
                  label: Text(
                    'Sign Out',
                    style: AppTextStyles.heading1MediumWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors
                        .primary700, // Added background color for visibility
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
