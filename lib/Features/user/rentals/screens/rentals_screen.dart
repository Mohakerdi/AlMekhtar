import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/CustomAppBar.dart';
import 'package:mabeet/Features/user/rentals/screens/add_property_screen.dart';
import 'package:mabeet/Features/user/rentals/widgets/rentals_property.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: AppStrings.rentalsScreenTitle.tr()),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyProperties.length,
        itemBuilder: (context, index) {
          final property = dummyProperties[index];
          return RentalsProperty(property: property);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPropertyScreen()),
          );
        },
        //label: Text("add new property"),
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
