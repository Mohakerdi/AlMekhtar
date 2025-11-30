import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/widgets/filter_overlay.dart';
import 'package:mabeet/Features/user/home/widgets/location_vector.dart';
import 'package:mabeet/Features/user/home/widgets/popular_property.dart';
import 'package:mabeet/Features/user/home/widgets/properties_list.dart';
import 'package:mabeet/Features/user/home/widgets/recommended_home_property.dart';
import 'package:mabeet/Features/user/home/widgets/search_field.dart';
import 'package:mabeet/Features/user/home/widgets/swiper.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/property.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showOverlay() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: FilterOverlay(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(onBtnPressed: _showOverlay),
              const SizedBox(height: 25),
              const Swiper(),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended', style: AppTextStyles.heading2Medium),
                  InkWell(
                    child: Text(
                      'See all',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: [
                    RecommendedHomeProperty(),
                    RecommendedHomeProperty(),
                    RecommendedHomeProperty(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Locations', style: AppTextStyles.heading2Medium),
                  InkWell(
                    child: Text(
                      'See all',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LocationVector(
                      name: 'Damascus',
                      image: AppImages.kDyarImage,
                    ),
                    LocationVector(name: 'Homs', image: AppImages.kDyarImage),
                    LocationVector(
                      name: 'Ref Dimasheq',
                      image: AppImages.kDyarImage,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular for you', style: AppTextStyles.heading2Medium),
                  InkWell(
                    child: Text(
                      'See all',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: PropertiesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
