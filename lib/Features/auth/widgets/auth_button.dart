import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.buttonsText, required this.onBtnPressed});

  final String buttonsText;
  final Function onBtnPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: (){
          onBtnPressed();
        },
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
        child: Text(buttonsText, style: AppTextStyles.labelButton),
      ),
    );
  }
}

