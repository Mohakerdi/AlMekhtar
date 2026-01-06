import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/strings.dart';

import '../../../core/theme/text_styles.dart';

class AgreeTerms extends StatefulWidget {

  final ValueChanged<bool> onTermsChanged;
  const AgreeTerms({super.key, required this.onTermsChanged});

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
              widget.onTermsChanged(isChecked);
            },
            splashRadius: 15,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: AppStrings.agreeWith.tr(), style: AppTextStyles.bodyLarge),
              TextSpan(text: AppStrings.terms.tr(), style: AppTextStyles.bodyLargeSemiBold),
              TextSpan(text: AppStrings.and.tr(), style: AppTextStyles.bodyLarge),
              TextSpan(
                text: AppStrings.privacy.tr(),
                style: AppTextStyles.bodyLargeSemiBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
