import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class AboutUsShowDetails extends StatelessWidget {
  const AboutUsShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // This Center widget and its children were moved here
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Expanded(
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
            SizedBox(height: 16),
            Text(
              'What is the salary of a bigbasket?',
              textAlign: TextAlign.start,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(letterSpacing: 0.0, fontWeight: FontWeight.bold, fontFamily: 'Satoshi'),
            ),
            SizedBox(height: 16),
            Text(
              'Wasselly is your trusted, local grocery delivery app, built to simplify your life. Founded by Kerdi and Armoush, our mission is simple: to bring the freshest produce and essential pantry items from our shelves directly to your door, fast.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontFamily: 'Satoshi',
                color: AppColors.gray300,
                fontSize: 17,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We understand that your time is valuable. That’s why we leverage smart technology and efficient logistics to ensure every order is handled with care and delivered when you need it. By prioritizing quality, speed, and reliability. ',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontFamily: 'Satoshi',
                color: AppColors.gray300,
                fontSize: 17,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Wasselly is more than an app—it\'s your neighborhood connection for worry-free grocery shopping. We\’re dedicated to serving our community and making the process of stocking your home effortless.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontFamily: 'Satoshi',
                color: AppColors.gray300,
                fontSize: 17,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
