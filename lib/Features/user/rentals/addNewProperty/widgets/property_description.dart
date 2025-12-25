import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        maxLines: 10,
        minLines: 1,
        decoration: InputDecoration(
          labelText: "Enter your property description",
          labelStyle: TextStyle(color: AppColors.gray400),
        ),
      ),
    );
  }
}
