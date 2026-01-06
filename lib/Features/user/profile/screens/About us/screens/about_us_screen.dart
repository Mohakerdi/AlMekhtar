import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/About%20us/widgets/about_us_details.dart';
import 'package:mabeet/core/constants/strings.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.menuAboutUs.tr()),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: const AboutUsShowDetails(),
    );
  }
}
