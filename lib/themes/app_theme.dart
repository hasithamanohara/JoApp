import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.accent,
      textTheme: const TextTheme(
        headlineLarge: AppStyles.headerLarge,
        headlineMedium: AppStyles.headerMedium,
        bodyMedium: AppStyles.bodyText,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.primaryButton,
      ),
    );
  }
}
