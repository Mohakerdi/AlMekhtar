import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class NotificationShimmerItem extends StatelessWidget {
  const NotificationShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray300.withAlpha(50),
      highlightColor: AppColors.gray200,
      child: Card(
        margin: const EdgeInsets.all(10),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.gray300, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
          ),
          title: Container(
            height: 14.0,
            width: double.infinity,
            color: Colors.white,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(height: 10.0, width: 200.0, color: Colors.white),
              const SizedBox(height: 4),
              Container(height: 8.0, width: 100.0, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
