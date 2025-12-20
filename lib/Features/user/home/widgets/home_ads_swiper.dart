import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/theme/app_colors.dart';

class HomeAdsSwiper extends StatefulWidget {
  const HomeAdsSwiper({super.key});

  @override
  State<HomeAdsSwiper> createState() => _HomeAdsSwiperState();
}

class _HomeAdsSwiperState extends State<HomeAdsSwiper> {
  final List<String> images = [
    AppImages.kSliderImage1,
    AppImages.kSliderImage2,
    AppImages.kSliderImage3,
    AppImages.kSliderImage4,
  ];

  final CarouselSliderController _carouselController = CarouselSliderController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: images.length,
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: 120,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
        Container(
          child: Column(
            children:[
              SizedBox(height: 130,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: Container(
                      width:8, height: 8,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          shape: _currentIndex == entry.key ? BoxShape.rectangle: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? AppColors.primary700
                              : Colors.grey,
                        borderRadius: _currentIndex== entry.key?
                            BorderRadius.circular(20)
                            : null,
                      ),
                    ),
                  );
                }).toList()
            ),]
          ),
        )
      ],
    );
  }
}
