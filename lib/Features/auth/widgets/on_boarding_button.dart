import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/auth/screens/create_account_screen.dart';
import 'package:mabeet/Features/auth/screens/login_screen.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/cache/cache_helper.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class OnBoardingButton extends StatefulWidget {
  const OnBoardingButton({super.key, required this.isLastPage, required this.buttonText, required this.controller});

  final bool isLastPage;
  final String buttonText;
  final CarouselSliderController controller;

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

class _OnBoardingButtonState extends State<OnBoardingButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () async {
            if (widget.isLastPage) {
              await CacheHelper.saveData(key: ApiKey.onBoardingSeen, value: true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CreateAccountScreen();
                  },
                ),
              );
            } else {
              widget.controller.nextPage(
                duration: const Duration(milliseconds: 300),
              );
            }
          },
          child: Text(widget.buttonText, style: AppTextStyles.labelButton),
        ),
      ),
    );
  }
}
