import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/strings.dart';

import '../../../../../core/constants/icons.dart';
import '../../../../../core/theme/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        onPressed();
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            AppIcons.searchIcon,
            color: AppColors.primary700,
            size: 30,
          ),
        ),
        hintText: AppStrings.searchFieldHint.tr(),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(AppIcons.filterIcon, color: AppColors.primary700),
        ),
      ),
    );
  }
}
