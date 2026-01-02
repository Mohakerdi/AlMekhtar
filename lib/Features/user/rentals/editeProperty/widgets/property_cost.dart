import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class PropertyCost extends StatelessWidget {
  final TextEditingController controller;
  const PropertyCost({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Enter your propeety cost',
          labelStyle: TextStyle(color: AppColors.gray400),
          suffixText: '\$',
          suffixStyle: TextStyle(color: AppColors.gray400),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
