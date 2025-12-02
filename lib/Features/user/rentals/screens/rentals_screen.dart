import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/rentals/widgets/rentals_property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyProperties.length,
        itemBuilder: (context, index) {
          final property = dummyProperties[index];
          return RentalsProperty(property: property);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //label: Text("add new property"),
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
