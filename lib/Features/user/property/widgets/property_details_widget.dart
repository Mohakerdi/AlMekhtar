import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class PropertyDetailsWidget extends StatelessWidget {
  final int floor;
  final double area;
  final double rate;

  const PropertyDetailsWidget({
    super.key,
    required this.floor,
    required this.area,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Floor: $floor',
              textAlign: TextAlign.justify,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.primary400,
              ),
            ),
            Text(
              'Area: $area m^2',
              textAlign: TextAlign.justify,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.primary400,
              ),
            ),
            Text(
              'Rate: $rate',
              textAlign: TextAlign.justify,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.primary400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
