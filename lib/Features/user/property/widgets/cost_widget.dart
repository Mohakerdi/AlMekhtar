import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class CostWidget extends StatelessWidget {
  final double costPerNight;
  const CostWidget({super.key, required this.costPerNight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$${costPerNight.toString()}",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primary700,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "/${AppStrings.night.tr()}",
          style: TextStyle(fontSize: 13, color: AppColors.gray400),
        ),
      ],
    );
  }
}
