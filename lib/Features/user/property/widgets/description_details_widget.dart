import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class DescriptionDetailsWidget extends StatelessWidget {
  final String description;

  const DescriptionDetailsWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          description,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 15, color: AppColors.gray400),
        ),
      ),
    );
  }
}
