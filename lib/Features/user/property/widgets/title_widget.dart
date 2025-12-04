import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.gray950,
      ),
    );
  }
}
