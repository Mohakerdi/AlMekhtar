import 'package:flutter/material.dart';

import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_colors.dart';

class SwitchScreenText extends StatelessWidget {
  const SwitchScreenText({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  final String txt;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account ? '),
          InkWell(
            onTap: () {
              onPressed();
            },
            child: Text(
              'Login',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.primary700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
