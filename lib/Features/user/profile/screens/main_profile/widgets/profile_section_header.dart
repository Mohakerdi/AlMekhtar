import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class ProfileSectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const ProfileSectionHeader({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // الوصول إلى الألوان من Theme.of(context)
    return ListTile(
      leading: Icon(icon, size: 30, color: AppColors.primary950),

      title: Text(title, style: TextStyle(fontSize: 24)),

      onTap: onTap,
    );
  }
}
