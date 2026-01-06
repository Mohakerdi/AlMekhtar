import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookingPropertyShimmer extends StatelessWidget {
  const BookingPropertyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: ShimmerPlaceholder(
                            width: double.infinity,
                            height: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const ShimmerPlaceholder(
                          width: 40,
                          height: 16,
                          borderRadius: 6,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    const ShimmerPlaceholder(
                      width: 150,
                      height: 12,
                    ),
                    const SizedBox(height: 8),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price Placeholder
                        ShimmerPlaceholder(width: 80, height: 14),
                        // Rating Placeholder
                        ShimmerPlaceholder(width: 50, height: 14),
                      ],
                    ),

                    const SizedBox(height: 8),
                    _buildDateSectionShimmer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSectionShimmer() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.white),
        ShimmerPlaceholder(width: 100, height: 12),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Start Date Chip placeholder
            ShimmerPlaceholder(width: 80, height: 12),
            // End Date Chip placeholder
            ShimmerPlaceholder(width: 80, height: 12),
          ],
        ),
      ],
    );
  }
}
class ShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerPlaceholder({
    required this.width,
    required this.height,
    this.borderRadius = 4.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}