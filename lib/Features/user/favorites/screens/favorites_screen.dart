import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/favorites/widgets/favorites_property.dart';
import 'package:mabeet/Features/user/home/widgets/CustomAppBar.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Favorites'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyProperties.length,
        itemBuilder: (context, index) {
          final property = dummyProperties[index];
          return FavoritesProperty(property: property);
        },
      ),
    );
  }
}
