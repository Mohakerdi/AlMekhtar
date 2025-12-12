import 'package:flutter/material.dart';

import '../../../core/theme/text_styles.dart';

class AgreeTerms extends StatefulWidget {
  const AgreeTerms({super.key});

  @override
  State<AgreeTerms> createState() => _AgreeTermsState();
}

class _AgreeTermsState extends State<AgreeTerms> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,

            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
            splashRadius: 15,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'Agree with', style: AppTextStyles.bodyLarge),
              TextSpan(text: ' terms', style: AppTextStyles.bodyLargeSemiBold),
              TextSpan(text: ' and', style: AppTextStyles.bodyLarge),
              TextSpan(
                text: ' privacy',
                style: AppTextStyles.bodyLargeSemiBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
