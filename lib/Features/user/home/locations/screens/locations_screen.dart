import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/strings.dart';
import '../../../../../data/models/state.dart';
import '../widgets/city_card.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.locationsTitle.tr()),),
      body: ListView.builder(
        itemCount: syrianStates.length,
        itemBuilder: (context, index) => CityCard(city: syrianStates[index].locationEnum!),
      ),
    );
  }
}
