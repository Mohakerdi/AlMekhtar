import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Inter';

  static TextStyle _style({
    required double size,
    required FontWeight weight,
    Color color = AppColors.darkText,
    double? height,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  // 1. DISPLAY STYLES
  static TextStyle get display1Regular => _style(size: 48.0, weight: FontWeightHelper.regular);
  static TextStyle get display1Medium => _style(size: 48.0, weight: FontWeightHelper.medium);
  static TextStyle get display1SemiBold => _style(size: 48.0, weight: FontWeightHelper.semiBold);
  static TextStyle get display1Bold => _style(size: 48.0, weight: FontWeightHelper.bold);

  static TextStyle get display2Regular => _style(size: 38.0, weight: FontWeightHelper.regular, color: AppColors.primary700);
  static TextStyle get display2Medium => _style(size: 38.0, weight: FontWeightHelper.medium, color: AppColors.primary700);
  static TextStyle get display2SemiBold => _style(size: 38.0, weight: FontWeightHelper.semiBold, color: AppColors.primary700);
  static TextStyle get display2Bold => _style(size: 38.0, weight: FontWeightHelper.bold, color: AppColors.primary700);

  // 2. HEADING STYLES
  static TextStyle get heading1Regular => _style(size: 28.0, weight: FontWeightHelper.regular);
  static TextStyle get heading1Medium => _style(size: 28.0, weight: FontWeightHelper.medium);
  static TextStyle get heading1SemiBold => _style(size: 28.0, weight: FontWeightHelper.semiBold);
  static TextStyle get heading1Bold => _style(size: 28.0, weight: FontWeightHelper.bold);

  static TextStyle get heading2Regular => _style(size: 24.0, weight: FontWeightHelper.regular);
  static TextStyle get heading2Medium => _style(size: 24.0, weight: FontWeightHelper.medium);
  static TextStyle get heading2SemiBold => _style(size: 24.0, weight: FontWeightHelper.semiBold);
  static TextStyle get heading2Bold => _style(size: 24.0, weight: FontWeightHelper.bold);

  // 3. TITLE / SUBTITLE STYLES
  static TextStyle get titleLarge => _style(size: 20.0, weight: FontWeightHelper.semiBold);
  static TextStyle get titleMedium => _style(size: 18.0, weight: FontWeightHelper.medium);

  // 4. BODY TEXT STYLES
  static TextStyle get bodyLarge => _style(size: 16.0, weight: FontWeightHelper.regular);
  static TextStyle get bodyLargeSemiBold => _style(size: 16.0, weight: FontWeightHelper.semiBold);

  static TextStyle get bodyMedium => _style(size: 14.0, weight: FontWeightHelper.regular, color: AppColors.lightText);
  static TextStyle get bodyMediumBold => _style(size: 14.0, weight: FontWeightHelper.bold);

  static TextStyle get bodySmall => _style(size: 12.0, weight: FontWeightHelper.regular, color: AppColors.lightText);
  static TextStyle get bodySmallMedium => _style(size: 12.0, weight: FontWeightHelper.medium);

  // 5. LABEL & CAPTION STYLES (Buttons, tags, small details)
  static TextStyle get labelButton => _style(size: 22.0, weight: FontWeightHelper.light, color: AppColors.card);
  static TextStyle get caption => _style(size: 10.0, weight: FontWeightHelper.regular, color: AppColors.lightText);
}