import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/bookings/rentNow/screens/rent_now_screen.dart';
import 'package:mabeet/Features/user/property/widgets/favorite_icon-button.dart';
import 'package:mabeet/Features/user/property/widgets/cost_widget.dart';
import 'package:mabeet/Features/user/property/widgets/description_details_widget.dart';
import 'package:mabeet/Features/user/property/widgets/description_widget.dart';
import 'package:mabeet/Features/user/property/widgets/location_widget.dart';
import 'package:mabeet/Features/user/property/widgets/property_details.dart';
import 'package:mabeet/Features/user/property/widgets/property_details_widget.dart';
import 'package:mabeet/Features/user/property/widgets/title_widget.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../data/models/property.dart';
import '../widgets/details_slider.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({
    super.key,
    required this.property,
    required this.isOwner,
  });

  final Property property;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              onPressed: () {},
              icon: Icon(AppIcons.share),
              tooltip: '',
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: FavoriteIconButton(property: property),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsSlider(imageAssets: property.imageURLs),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleWidget(title: property.title),
                  CostWidget(costPerNight: property.costPerNight),
                ],
              ),
            ),
            LocationWidget(
              govenorant: property.state,
              area: property.city,
              detailed: property.describedLocation,
            ),
            SizedBox(height: 30),
            PropertyDetails(),
            PropertyDetailsWidget(
              floor: property.floor,
              area: property.area,
              rate: property.avgRate,
            ),
            SizedBox(height: 25),
            DescriptionWidget(),
            DescriptionDetailsWidget(description: property.description),
            SizedBox(height: 90),
          ],
        ),
      ),
      floatingActionButton: isOwner
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: RentNowScreen(property: property),
                );
              },
              label: Text(AppStrings.rentNowButton.tr()),
              backgroundColor: AppColors.primary700,
              extendedPadding: EdgeInsets.symmetric(horizontal: 130),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
