import 'package:flutter/material.dart';
import '../../../../../data/models/state.dart';
import '../widgets/city_card.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Discover New Places !!'),),
      body: ListView.builder(
        itemCount: syrianStates.length,
        itemBuilder: (context, index) => CityCard(city: syrianStates[index].locationEnum!),
      ),
    );
  }
}
