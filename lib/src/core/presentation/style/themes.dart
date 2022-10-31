import 'package:flutter/material.dart';
import 'package:weather/src/core/presentation/style/colors.dart';
import 'package:weather/src/core/presentation/style/typography.dart';

class AppThemes {
  const AppThemes._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppTypography.fontFamily,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primaryColor,
    ),
  );
  
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppTypography.fontFamily,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
  );
}
