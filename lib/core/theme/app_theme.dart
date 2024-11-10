import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.dark,
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.background, contentTextStyle: TextStyle(color: Colors.white)),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.secondaryBackground,
          filled: true,
          hintStyle: const TextStyle(color: Color(0xffA7A7A7), fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
      ));
}
