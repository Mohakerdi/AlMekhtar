import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'text_styles.dart';

ThemeData get lightTheme {
  const double _defaultRadius = 16.0;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // 1. COLOR SCHEME
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary700,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      error: AppColors.errorBase,
      onError: AppColors.errorBase,
      surface: Colors.white,
      onSurface: AppColors.gray900,
    ),
    scaffoldBackgroundColor: AppColors.background,

    // 2. TEXT STYLE MAPPING
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display1Bold,
      displayMedium: AppTextStyles.display2Bold,
      headlineLarge: AppTextStyles.heading1Bold,
      headlineMedium: AppTextStyles.heading2Bold,

      // Title Mappings
      titleLarge: AppTextStyles.heading2SemiBold,
      titleMedium: AppTextStyles.bodyMedium,

      // Body Mappings
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.caption,

      // Label Mappings (Buttons)
      labelLarge: AppTextStyles.labelButton,
    ),

    // 3. COMPONENT THEMES
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.gray900,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.heading2SemiBold.copyWith(color: AppColors.gray900),
      iconTheme: const IconThemeData(color: AppColors.gray900),
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary700,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.labelButton,
        minimumSize: const Size(double.infinity, 56), // Tall standard button
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        elevation: 0,
      ),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray400),
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
        borderSide: const BorderSide(color: AppColors.primary700, width: 1.5),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.gray600,
      size: 24,
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.gray200,
      thickness: 1,
    ),
  );
}