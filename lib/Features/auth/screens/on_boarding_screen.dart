import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mabeet/Features/auth/screens/login_screen.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class OnboardingContent {
  final String imagePath;
  final String title;
  final String description;

  OnboardingContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingContent> contents = [
  OnboardingContent(
    imagePath: AppImages.kAleppo,
    title: 'Find the perfect place for your future house',
    description:
        'find the best place for your dream house with your family and loved ones',
  ),
  OnboardingContent(
    imagePath: AppImages.kDamascus,
    title: 'Discover beautiful properties near you',
    description:
        'explore thousands of verified listings and detailed information',
  ),
  OnboardingContent(
    imagePath: AppImages.kRefDemasheq,
    title: 'Find your dream home with us',
    description:
        'Just search and select your favorite property you want to locate',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _currentIndex == contents.length - 1;
    final String buttonText = isLastPage ? 'Get Started' : 'Next';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: contents.length,
              carouselController: _controller,
              itemBuilder: (context, index, realIndex) {
                return _buildCarouselItem(contents[index]);
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
                  onTap: () => _controller.animateToPage(entry.key),
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

          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (isLastPage) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                ),
                child: Text(buttonText, style: AppTextStyles.labelButton),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(OnboardingContent content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(content.imagePath, fit: BoxFit.fill),
                          Container(
                            color: AppColors.primary300.withAlpha(210),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(content.imagePath, fit: BoxFit.fill),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
