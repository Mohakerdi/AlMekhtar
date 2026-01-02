import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class PropertyTitle extends StatelessWidget {
  const PropertyTitle({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "Enter your property title",
          labelStyle: TextStyle(color: AppColors.gray400),
          suffixIcon: Icon(AppIcons.homeIcon),
        ),
      ),
    );
  }
}
