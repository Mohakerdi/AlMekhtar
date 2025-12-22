  import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/on_boarding_button.dart';
import '../widgets/on_boarding_slider_item.dart';
import '../../../core/constants/on_boarding_content.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _currentIndex == contents.length - 1;
    final String buttonText = isLastPage ? 'Get Started' : 'Next';

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: contents.length,
              carouselController: controller,
              itemBuilder: (context, index, realIndex) {
                return OnBoardingSliderItem(content: contents[index]);
              },
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: contents.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => controller.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentIndex == entry.key ? 32.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: _currentIndex == entry.key
                          ? AppColors.primary700
                          : AppColors.gray300,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          OnBoardingButton(isLastPage: isLastPage, buttonText: buttonText, controller: controller)
        ],
      ),
    );
  }
}
