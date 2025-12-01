import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

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
      trailing: const Icon(Icons.chevron_right, color: AppColors.gray300),
      onTap: onTap,
    );
  }
}
