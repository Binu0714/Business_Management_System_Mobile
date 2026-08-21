import 'package:flutter/material.dart';

class AppColors {
  // Brand Primary
  static const Color primary = Color(0xFFFF5722);
  static const Color primaryDark = Color(0xFFE64A19);

  // Brand Backgrounds & Surfaces
  static const Color background = Color(0xFFF8FAFF);
  static const Color white = Colors.white;

  // Slate tones
  static const Color darkSlate = Color(0xFF0F172A);
  static const Color textMain = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF94A3B8);

  // Status Colors
  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  static const Color partial = Color(0xFFEA580C);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.darkSlate,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
      ),
    );
  }
}