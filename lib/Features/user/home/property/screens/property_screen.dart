import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/property/widgets/details_slider.dart';
import 'package:mabeet/core/constants/images.dart';
import '../../../../../data/models/property.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DetailsSlider(imageAssets: [property.imageURL, AppImages.kDyarImage, AppImages.kDyarImage,]),
            ],
          ),
        ),
      ),
    );
  }
}
