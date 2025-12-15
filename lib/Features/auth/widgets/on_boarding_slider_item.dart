import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/constants/on_boarding_content.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

class OnBoardingSliderItem extends StatelessWidget {
  const OnBoardingSliderItem({super.key, required this.content});

  final OnboardingContent content;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: Image.asset(content.imagePath, fit: BoxFit.cover,)
            ),
            const SizedBox(height: 8),
            Text(
              content.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1Bold,
            ),
            const SizedBox(height: 10),
            Text(
              content.description,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
          ],
        ),
      );

  }
}
