import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/rentals/widgets/add_button.dart';
import 'package:mabeet/Features/user/rentals/widgets/location_description.dart';
import 'package:mabeet/Features/user/rentals/widgets/property_cost.dart';
import 'package:mabeet/Features/user/rentals/widgets/property_description.dart';
import 'package:mabeet/Features/user/rentals/widgets/property_title.dart';
import 'package:mabeet/Features/user/rentals/widgets/select%20_location.dart';
import 'package:mabeet/Features/user/rentals/widgets/select_from_gallery.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/state.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Property!')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            PropertyTitle(),
            SizedBox(height: 12),
            Divider(),
            SelectLocation(),
            Divider(),
            SelectFromGallery(onSelectImage: (image) {}),
            Divider(),
            LocationDescription(),
            PropertyDescription(),
            Divider(),
            PropertyCost(),
            AddButton(),
          ],
        ),
      ),
    );
  }
}
