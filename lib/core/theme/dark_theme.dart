import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'text_styles.dart';

ThemeData get darkTheme {
  const double _defaultRadius = 16.0;

  const Color darkScaffoldBg = AppColors.gray950;
  const Color darkSurface = AppColors.gray900;
  const Color darkBorder = AppColors.gray700;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // 1. COLOR SCHEME
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary300,
      onPrimary: AppColors.gray900,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.gray900,
      error: AppColors.error100,
      onError: AppColors.error900,
      surface: darkSurface,
      onSurface: Colors.white
    ),
    scaffoldBackgroundColor: darkScaffoldBg,

    // 2. TEXT STYLES MAPPING
    textTheme: TextTheme(
      // Heading Mappings
      displayLarge: AppTextStyles.display1Bold.copyWith(color: Colors.white),
      displayMedium: AppTextStyles.display2Bold.copyWith(color: Colors.white),
      headlineLarge: AppTextStyles.heading1Bold.copyWith(color: Colors.white),
      headlineMedium: AppTextStyles.heading2Bold.copyWith(color: Colors.white),

      // Title Mappings
      titleLarge: AppTextStyles.heading2SemiBold.copyWith(color: Colors.white),
      titleMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white),

      // Body Mappings
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.gray400),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray400),
      bodySmall: AppTextStyles.caption.copyWith(color: AppColors.gray500),

      // Label Mappings
      labelLarge: AppTextStyles.labelButton.copyWith(color: AppColors.gray900),
    ),

    // 3. COMPONENT THEMES
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: darkSurface,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.heading2SemiBold.copyWith(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary300,
        foregroundColor: AppColors.gray900,
        textStyle: AppTextStyles.labelButton.copyWith(color: AppColors.gray900),
        minimumSize: const Size(double.infinity, 56),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        elevation: 0,
      ),
    ),

    // Input Fields (TextField)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkScaffoldBg,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray600),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        borderSide: const BorderSide(color: darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        borderSide: const BorderSide(color: darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        borderSide: const BorderSide(color: AppColors.primary300, width: 1.5),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.gray300,
      size: 24,
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.gray700,
      thickness: 1,
    ),
  );
}