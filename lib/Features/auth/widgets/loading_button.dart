import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: (){},
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            AppColors.primary600,
          ),
        ),
        child: CircularProgressIndicator(color: AppColors.gray50,)
      ),
    );
  }
}

