import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OwnerPropertyShimmer extends StatelessWidget {
  const OwnerPropertyShimmer({super.key});

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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(width: 80, height: 80, radius: 8),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildShimmerContainer(
                          width: double.infinity,
                          height: 18,
                          radius: 4,
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            _buildShimmerContainer(width: 16, height: 16),
                            const SizedBox(width: 4),
                            _buildShimmerContainer(width: 120, height: 12),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildShimmerContainer(width: 80, height: 16),

                            Row(
                              children: [
                                _buildShimmerContainer(width: 18, height: 18),
                                const SizedBox(width: 4),
                                _buildShimmerContainer(width: 30, height: 16),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 50),

                  _buildShimmerContainer(width: 80, height: 35, radius: 8),

                  _buildShimmerContainer(width: 80, height: 35, radius: 8),

                  const SizedBox(width: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
