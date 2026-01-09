import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedHomePropertyShimmer extends StatelessWidget {
  const RecommendedHomePropertyShimmer({super.key});

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
      padding: EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 240,
        height: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 25,
                    top: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildShimmerContainer(
                            width: 80,
                            height: 28,
                            radius: 4,
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildShimmerContainer(width: 140, height: 20),
                              const SizedBox(height: 4),
                              _buildShimmerContainer(width: 100, height: 12),
                            ],
                          ),

                          _buildShimmerContainer(
                            width: 28,
                            height: 28,
                            radius: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
