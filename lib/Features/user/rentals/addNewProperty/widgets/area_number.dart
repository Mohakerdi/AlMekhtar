import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class AreaNumber extends StatelessWidget {
  const AreaNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Area',
          labelStyle: TextStyle(color: AppColors.gray400),
          suffixText: 'm²',
          suffixStyle: TextStyle(color: AppColors.gray400),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
