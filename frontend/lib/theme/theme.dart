import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/text_style.dart';

class CustomTheme {
  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        textTheme: CustomTextThemeDefinition.darkTextTheme,
        primaryColor: CustomColors.warmGreyFog,
        scaffoldBackgroundColor: CustomColors.tunaDark,
        colorScheme: const ColorScheme.dark(
          primary: CustomColors.warmGreyFog,
          secondary: CustomColors.warmGreyMedium,
        ),
      );

  static ThemeData getLightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        textTheme: CustomTextThemeDefinition.lightTextTheme,
        primaryColor: CustomColors.charcoalBlack,
        scaffoldBackgroundColor: CustomColors.warmGreyFog,
        colorScheme: const ColorScheme.light(
          primary: CustomColors.charcoalBlack,
          secondary: CustomColors.charcoalMedium,
        ),
      );
}
