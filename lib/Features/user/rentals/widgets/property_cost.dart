import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class PropertyCost extends StatelessWidget {
  const PropertyCost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        maxLines: 10,
        minLines: 3,
        decoration: InputDecoration(
          labelText: "Enter your property description",
          labelStyle: TextStyle(color: AppColors.gray400),
        ),
      ),
    );
  }
}
