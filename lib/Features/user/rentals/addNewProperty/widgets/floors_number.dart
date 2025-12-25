import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class FloorsNumber extends StatelessWidget {
  final void Function(double value) onChanged;

  const FloorsNumber({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SpinBox(
        min: 1,
        max: 50,
        value: 1,
        decoration: const InputDecoration(
          labelText: 'Number of Floors',
          labelStyle: TextStyle(color: AppColors.gray400),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
