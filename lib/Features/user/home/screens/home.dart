import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_cubit.dart';
import 'package:mabeet/core/widgets/CustomAppBar.dart';
import '../locations/screens/locations_screen.dart';
import '../search/screens/search_screen.dart';
import '../search/widgets/filter_overlay.dart';
import '../widgets/locations_slider.dart';
import '../widgets/properties_list.dart';
import '../widgets/recommended_home_property.dart';
import '../search/widgets/search_field.dart';
import '../widgets/home_ads_swiper.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../data/repos/dummy_properties.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
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
        child: FilterOverlay(
          onApply: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (builder) => const SearchScreen()),
            );
          },
        ),
      ),
    );
  }

  void _goToLocationsScreen() {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: LocationsScreen(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  void _goToSearchScreen() {
    context.read<SearchFilterCubit>().seeAllFilters();

    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: SearchScreen(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(titleText: AppStrings.homeScreenTitle.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(onPressed: _showOverlay),
              const SizedBox(height: 25),
              const HomeAdsSwiper(),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.recommendedSectionTitle.tr(),
                    style: AppTextStyles.heading2Medium,
                  ),
                  InkWell(
                    onTap: _goToSearchScreen,
                    child: Text(
                      AppStrings.seeAllButton.tr(),
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
                  Text(
                    AppStrings.topLocationsSectionTitle.tr(),
                    style: AppTextStyles.heading2Medium,
                  ),
                  InkWell(
                    onTap: _goToLocationsScreen,
                    child: Text(
                      AppStrings.seeAllButton.tr(),
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                  ),
                ],
              ),
              LocationsSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.popularForYouSectionTitle.tr(),
                    style: AppTextStyles.heading2Medium,
                  ),
                  InkWell(
                    onTap: _goToSearchScreen,
                    child: Text(
                      AppStrings.seeAllButton.tr(),
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
