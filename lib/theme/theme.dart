import 'package:skeleton_231210/constants/proxy.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ThemeColors.green,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ThemeColors.blue),
    hintColor: ThemeColors.blue500,
    dividerColor: ThemeColors.blue500,
    scaffoldBackgroundColor: ThemeColors.tangerine100,
    canvasColor: ThemeColors.tangerine100,
    fontFamily: ProxyConstants.getFontFamily(ProxyFontFamily.body),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45, width: 1.0),
      ),
    ),
  );
}
