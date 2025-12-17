import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/locations/widgets/location_vector.dart';

import '../../../../data/models/state.dart';

class LocationsSlider extends StatelessWidget {
  const LocationsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          LocationVector(
            name: syrianStates[0].name,
            image: syrianStates[0].locationEnum!.imagePath,
          ),
          LocationVector(
            name: syrianStates[3].name,
            image: syrianStates[3].locationEnum!.imagePath,
          ),
          LocationVector(
            name: syrianStates[9].name,
            image: syrianStates[9].locationEnum!.imagePath,
          ),
        ],
      ),
    );
  }
}
