import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

ThemeData get lightTheme {
  const double _defaultRadius = 16.0;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // 1. COLOR SCHEME
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary500, // Bright Red
      onPrimary: Colors.white,
      secondary: AppColors.secondary, // Navy Blue
      error: AppColors.errorBase,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.gray900,
    ),

    scaffoldBackgroundColor: AppColors.background,

    // 2. TEXT STYLE MAPPING
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display1Bold,
      displayMedium: AppTextStyles.display2Bold.copyWith(
        color: AppColors.secondary,
      ), // Use Navy for branding
      headlineLarge: AppTextStyles.heading1Bold,
      headlineMedium: AppTextStyles.heading2Bold,
      titleLarge: AppTextStyles.heading2SemiBold,
      titleMedium: AppTextStyles.bodyMedium,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.caption,
      labelLarge: AppTextStyles.labelButton,
    ),

    // 3. COMPONENT THEMES
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.gray900,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.heading2SemiBold.copyWith(
        color: AppColors.gray900,
      ),
      iconTheme: const IconThemeData(color: AppColors.gray900),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500, // Red
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.labelButton,
        minimumSize: const Size(double.infinity, 56),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        elevation: 0,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.gray300),
      errorMaxLines: 1,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        borderSide: const BorderSide(color: AppColors.gray200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        borderSide: const BorderSide(color: AppColors.gray200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        borderSide: const BorderSide(color: AppColors.primary500, width: 1.5),
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.gray600, size: 24),

    dividerTheme: const DividerThemeData(
      color: AppColors.gray200,
      thickness: 1,
    ),
  );
}