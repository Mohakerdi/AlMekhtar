import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class AboutUsShowDetails extends StatelessWidget {
  const AboutUsShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              AppImages.kDamascus,
              height: 168,
              width: 388,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 24),
          Text(
            AppStrings.aboutUsWelcomeTitle.tr(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold, fontFamily: 'Satoshi'),
          ),
          SizedBox(height: 8),
          Text(
            AppStrings.aboutUsWelcomeBody.tr(),
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontFamily: 'Satoshi',
              color: AppColors.gray300,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 24),
          Text(
            AppStrings.aboutUsMissionTitle.tr(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold, fontFamily: 'Satoshi'),
          ),
          SizedBox(height: 8),
          Text(
            AppStrings.aboutUsMissionBody.tr(),
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontFamily: 'Satoshi',
              color: AppColors.gray300,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 24),
          Text(
            AppStrings.aboutUsVisionTitle.tr(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold, fontFamily: 'Satoshi'),
          ),
          SizedBox(height: 8),

          // 6. VISION BODY
          Text(
            AppStrings.aboutUsVisionBody.tr(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontFamily: 'Satoshi',
              color: AppColors.gray300,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}