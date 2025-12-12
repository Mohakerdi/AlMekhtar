import 'package:mabeet/core/constants/images.dart';

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
    imagePath: AppImages.kOnBoarding1,
    title: 'Find the perfect place for your future house',
    description:
    'find the best place for your dream house with your family and loved ones',
  ),
  OnboardingContent(
    imagePath: AppImages.kOnBoarding2,
    title: 'Discover beautiful properties near you',
    description:
    'explore thousands of verified listings and detailed information',
  ),
  OnboardingContent(
    imagePath: AppImages.kOnBoarding3,
    title: 'Find your dream home with us',
    description:
    'Just search and select your favorite property you want to locate',
  ),
];
