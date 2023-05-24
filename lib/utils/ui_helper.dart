import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/constants/app_color.dart';

class AppFont {
  static String roboto = 'Roboto';
}

class UITextStyle {
  static TextStyle getTextStyle(
      {FontStyle? fontStyle,
      String? fontFamily,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      bool isFixed = false,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    double finalFontSize = fontSize ?? 12;
    if (isFixed) {
      finalFontSize = finalFontSize.w;
    }

    return TextStyle(
        fontSize: finalFontSize,
        fontFamily: fontFamily ?? AppFont.roboto,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColor.textDark,
        letterSpacing: characterSpacing,
        wordSpacing: wordSpacing,
        height: lineSpacing,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration);
  }

  static h1TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 96.sp,
      lineSpacing: lineSpacing ?? 0.9.sp,
      characterSpacing: characterSpacing ?? (-1.5).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static h2TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 60.sp,
      lineSpacing: lineSpacing ?? 1.02.sp,
      characterSpacing: characterSpacing ?? (-0.5).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static h3TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 48.sp,
      lineSpacing: lineSpacing ?? 0.9.sp,
      characterSpacing: characterSpacing,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static h4TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 34.sp,
      lineSpacing: lineSpacing ?? 0.9.sp,
      characterSpacing: characterSpacing,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static h5TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 24.sp,
      lineSpacing: lineSpacing ?? 0.8.sp,
      characterSpacing: characterSpacing ?? (0.18).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static h6TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 20.sp,
      lineSpacing: lineSpacing ?? 1.02.sp,
      characterSpacing: characterSpacing ?? (0.15).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static subtitle1TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 16.sp,
      lineSpacing: lineSpacing ?? 1.28.sp,
      characterSpacing: characterSpacing ?? (0.15).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static subtitle2TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 14.sp,
      lineSpacing: lineSpacing ?? 1.46.sp,
      characterSpacing: characterSpacing ?? (0.1).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static body1TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 16.sp,
      lineSpacing: lineSpacing ?? 1.28.sp,
      characterSpacing: characterSpacing ?? (0.5).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static body2TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 14.sp,
      lineSpacing: lineSpacing ?? 1.21.sp,
      characterSpacing: characterSpacing ?? (0.25).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static buttonTextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 14.sp,
      lineSpacing: lineSpacing ?? 0.97.sp,
      characterSpacing: characterSpacing ?? (1.25).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static caption1TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 12.sp,
      lineSpacing: lineSpacing ?? 1.13.sp,
      characterSpacing: characterSpacing ?? (0.4).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static caption2TextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 12.sp,
      lineSpacing: lineSpacing ?? 1.13.sp,
      characterSpacing: characterSpacing ?? (0.4).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static overLineTextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 10.sp,
      lineSpacing: lineSpacing ?? 1.37.sp,
      characterSpacing: characterSpacing ?? (1.5).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }

  static navTextStyle(
      {double? fontSize,
      Color? color,
      double? characterSpacing,
      double? wordSpacing,
      double? lineSpacing,
      TextDecoration? decoration}) {
    return getTextStyle(
      fontFamily: AppFont.roboto,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 8.sp,
      lineSpacing: lineSpacing ?? 1.7.sp,
      characterSpacing: characterSpacing ?? (1.5).sp,
      color: color ?? AppColor.textDark,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }
}

class UIHelper{

}