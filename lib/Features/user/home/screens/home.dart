import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/screens/locations_screen.dart';
import 'package:mabeet/Features/user/home/screens/search_screen.dart';
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
import 'package:mabeet/data/repos/dummy_properties.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/repos/Cities.dart';

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

  void _goToLocationsScreen() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (builder) => LocationsScreen()));
  }

  void _goToSearchScreen() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (builder) => SearchScreen()));
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
                    onTap: _goToSearchScreen,
                    child: Text(
                      'See all',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: [
                    RecommendedHomeProperty(property: dummyProperties[0]),
                    RecommendedHomeProperty(property: dummyProperties[3]),
                    RecommendedHomeProperty(property: dummyProperties[1]),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Locations', style: AppTextStyles.heading2Medium),
                  InkWell(
                    onTap: _goToLocationsScreen,
                    child: Text(
                      'See all',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LocationVector(
                      name: cities[0].location.name,
                      image: cities[0].imageURL,
                    ),
                    LocationVector(
                      name: cities[3].location.name,
                      image: cities[3].imageURL,
                    ),
                    LocationVector(
                      name: cities[9].location.name,
                      image: cities[9].imageURL,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular for you', style: AppTextStyles.heading2Medium),
                  InkWell(
                    onTap: _goToSearchScreen,
                    child: Text(
                      'See all',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
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
