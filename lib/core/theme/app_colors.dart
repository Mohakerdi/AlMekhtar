import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // 1. PRIMARY COLOR
  static const Color primary50 = Color(0xFFF9F5FF);
  static const Color primary100 = Color(0xFFF3EBFE);
  static const Color primary200 = Color(0xFFE9D5FE);
  static const Color primary300 = Color(0xFFD8B4FE);
  static const Color primary400 = Color(0xFFC084FC);
  static const Color primary500 = Color(0xFFA855F7);
  static const Color primary600 = Color(0xFF9333EA);
  static const Color primary700 = Color(0xFF7E22CE);
  static const Color primary800 = Color(0xFF6B21A8);
  static const Color primary900 = Color(0xFF581C87);
  static const Color primary950 = Color(0xFF3F1367);

  // 2. SECONDARY COLOR
  static const Color secondary = Color(0xFF0891B2);
  static const Color secondaryLight = Color(0xFFCCF1F9);

  // 3. BASE GRAY
  static const Color gray50 = Color(0xFFF8F8F8);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);
  static const Color gray950 = Color(0xFF070B14);


  // 4. STATUS COLORS
  // --- Error (Red) ---
  static const Color error50 = Color(0xFFFEF2F2);
  static const Color error100 = Color(0xFFFEE2E2);
  static const Color error700 = Color(0xFFB91C1C);
  static const Color error900 = Color(0xFF7F1D1D);
  static const Color errorBase = error700;

  // --- Success (Green) ---
  static const Color success50 = Color(0xFFF0FDF4);
  static const Color success100 = Color(0xFFDCFCE7);
  static const Color success700 = Color(0xFF059669);
  static const Color success900 = Color(0xFF065F46);
  static const Color successBase = success700;

  // --- Warning (Orange) ---
  static const Color warning50 = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning700 = Color(0xFFD97706);
  static const Color warning900 = Color(0xFF78350F);
  static const Color warningBase = warning700;


  // 5. Utility Colors
  static const Color background = gray50;
  static const Color card = gray50;
  static const Color lightText = gray500;
  static const Color darkText = gray800;
}