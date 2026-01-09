import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularPropertyShimmer extends StatelessWidget {
  const PopularPropertyShimmer({super.key});

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    double radius = 4.0,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            _buildShimmerContainer(width: 120, height: 100, radius: 10),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerContainer(width: 100, height: 16),
                      _buildShimmerContainer(width: 140, height: 12),
                      _buildShimmerContainer(width: 80, height: 12),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      _buildShimmerContainer(width: 28, height: 28, radius: 14),
                      const SizedBox(height: 20),
                      _buildShimmerContainer(width: 50, height: 25, radius: 4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
