import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/widgets/popular_property.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class PropertiesList extends StatelessWidget {
  PropertiesList({super.key});

  final List <Property> items = dummyProperties;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,

        itemBuilder: (ctx, idx) =>Column(
          children: [
            PopularProperty(property: items[idx]),
            if(idx != items.length-1) Divider() // to stop when reach the final one
          ],
        )
    );
  }
}
