import 'package:flutter/material.dart';
import 'package:mabeet/data/repos/Cities.dart';

import '../widgets/city_card.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Discover New Places !!'),),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) => CityCard(city: cities[index]),
      ),
    );
  }
}
