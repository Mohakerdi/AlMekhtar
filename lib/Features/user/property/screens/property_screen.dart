import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/property/widgets/cost_widget.dart';
import 'package:mabeet/Features/user/property/widgets/description_details_widget.dart';
import 'package:mabeet/Features/user/property/widgets/description_widget.dart';
import 'package:mabeet/Features/user/property/widgets/images_widget.dart';
import 'package:mabeet/Features/user/property/widgets/location_widget.dart';
import 'package:mabeet/Features/user/property/widgets/property_details.dart';
import 'package:mabeet/Features/user/property/widgets/title_widget.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import '../../../../data/models/property.dart';

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
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImagesWidget(images: property.imageURLs),
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
            LocationWidget(location: property.location),
            SizedBox(height: 30),
            PropertyDetails(),
            SizedBox(height: 25),
            DescriptionWidget(),
            DescriptionDetailsWidget(description: property.description),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Rent now"),
        backgroundColor: AppColors.primary700,
        extendedPadding: EdgeInsets.symmetric(horizontal: 130),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
