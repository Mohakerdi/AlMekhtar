import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RequestWidgetShimmer extends StatelessWidget {
  const RequestWidgetShimmer({super.key, this.showActions = true});

  final bool showActions;

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    double radius = 4.0,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: shape == BoxShape.rectangle ? BorderRadius.circular(radius) : null,
        shape: shape,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildShimmerContainer(width: 50, height: 50, shape: BoxShape.circle),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _buildShimmerContainer(width: double.infinity, height: 16),
                  ),

                  const SizedBox(width: 12),

                  _buildShimmerContainer(width: 50, height: 50, shape: BoxShape.circle),
                ],
              ),

              const Divider(height: 20),

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: [
                    _buildShimmerContainer(width: 16, height: 16),
                    const SizedBox(width: 8),
                    _buildShimmerContainer(width: 150, height: 14),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: [
                    _buildShimmerContainer(width: 16, height: 16),
                    const SizedBox(width: 8),
                    _buildShimmerContainer(width: 120, height: 14),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerContainer(width: 100, height: 13),
                      const SizedBox(height: 4),
                      _buildShimmerContainer(width: 100, height: 13),
                    ],
                  ),

                  _buildShimmerContainer(width: 60, height: 20),
                ],
              ),

              if (showActions) ...[
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildShimmerContainer(width: double.infinity, height: 40, radius: 8),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildShimmerContainer(width: double.infinity, height: 40, radius: 8),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}