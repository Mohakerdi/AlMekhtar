import 'package:flutter/material.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/theme/app_colors.dart';
class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onBtnPressed});

  final Function onBtnPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            AppIcons.searchIcon,
            color: AppColors.primary700,
            size: 30,
          ),
        ),
        hintText: 'Search Property',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(
              AppIcons.filterIcon,
              color: AppColors.primary700,
            ),
            onPressed: (){
              onBtnPressed();
            },
          ),
        ),
      ),
    );
  }
}
