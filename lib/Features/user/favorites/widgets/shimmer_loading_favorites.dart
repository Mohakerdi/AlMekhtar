import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';

class FavoritesPropertyShimmer extends StatelessWidget {
  const FavoritesPropertyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.gray200,
            highlightColor: AppColors.gray100,
            child: Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.gray200,
              highlightColor: AppColors.gray100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _line(width: double.infinity, height: 16),
                  const SizedBox(height: 8),
                  _line(width: 140, height: 14),
                  const SizedBox(height: 8),
                  _line(width: 90, height: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
