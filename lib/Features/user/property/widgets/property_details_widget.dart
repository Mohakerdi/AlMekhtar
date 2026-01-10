import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDetailItem(
            icon: AppIcons.floor,
            label: AppStrings.floor.tr(),
            value: '$floor',
          ),
          _buildVerticalDivider(),
          _buildDetailItem(
            icon: AppIcons.area,
            label: AppStrings.area.tr(),
            value: '$area m²',
          ),
          _buildVerticalDivider(),
          _buildDetailItem(
            icon: AppIcons.star,
            label: AppStrings.rate.tr(),
            value: '${rate.toStringAsFixed(1)}',
            iconColor: AppColors.warning700,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
    Color? iconColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor ?? AppColors.primary400, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.titleMedium
        ),
        Text(
          label,
          style: AppTextStyles.bodySmall
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: AppColors.gray200,
    );
  }
}