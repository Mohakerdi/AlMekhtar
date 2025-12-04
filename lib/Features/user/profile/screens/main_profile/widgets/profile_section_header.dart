import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String imagePath;

  const ProfileSectionWidget({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 70, backgroundImage: AssetImage(imagePath)),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          phoneNumber,
          style: const TextStyle(fontSize: 14, color: AppColors.gray700),
        ),
      ],
    );
  }
}
