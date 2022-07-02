import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class CustomTheme {
  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      );

  static ThemeData getLightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      );
}
