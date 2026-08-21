import 'package:flutter/material.dart';
import 'app_typography.dart';

class AppColors {
  static const Color primary = Color(0xFFFF5722);
  static const Color primaryDark = Color(0xFFE64A19);
  static const Color background = Color(0xFFF8FAFF);
  static const Color white = Colors.white;
  static const Color darkSlate = Color(0xFF0F172A);
  static const Color textMain = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  static const Color partial = Color(0xFFEA580C);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        background: AppColors.background,
        error: AppColors.error,
      ),

      textTheme: AppTypography.textTheme,
    );
  }
}