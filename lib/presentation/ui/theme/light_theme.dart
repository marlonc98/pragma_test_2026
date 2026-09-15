import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/theme/app_colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.brownMain,
    onSurface: AppColors.brownMain,
  ),
  scaffoldBackgroundColor: const Color(0xFFFFE6DF),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.brownMain,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.brownMain,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.brownMain,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.brownMain,
      foregroundColor: Colors.white,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
);
