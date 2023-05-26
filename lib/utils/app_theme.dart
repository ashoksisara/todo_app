import 'package:flutter/material.dart';
import '../shared/constants/app_color.dart';

class AppTheme {
  static getThemeData() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.bgLight,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.appWhite),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.appWhite),
          ),
        hintStyle: TextStyle(color: AppColor.appWhite),
      )
    );
  }
}
