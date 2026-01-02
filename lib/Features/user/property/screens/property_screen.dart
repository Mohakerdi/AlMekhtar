import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/bookings/rentNow/screens/rent_now_screen.dart';
import 'package:mabeet/Features/user/property/widgets/favorite_icon-button.dart';
import 'package:mabeet/Features/user/property/widgets/cost_widget.dart';
import 'package:mabeet/Features/user/property/widgets/description_details_widget.dart';
import 'package:mabeet/Features/user/property/widgets/description_widget.dart';
import 'package:mabeet/Features/user/property/widgets/location_widget.dart';
import 'package:mabeet/Features/user/property/widgets/property_details.dart';
import 'package:mabeet/Features/user/property/widgets/title_widget.dart';
import 'package:mabeet/Features/user/rentals/editeProperty/screens/edit_property_screen.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import '../../../../data/models/property.dart';
import '../widgets/details_slider.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          FavoriteIconButton(property: property),
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
            SizedBox(height: 25),
            DescriptionWidget(),
            DescriptionDetailsWidget(description: property.description),
            SizedBox(height: 90),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              //builder: (context) => RentNowScreen(property: property),
              builder: (context) => EditPropertyScreen(property: property),
            ),
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
