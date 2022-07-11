import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';

class CustomTextTheme extends InheritedWidget {
  const CustomTextTheme({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget != child;
  }

  static CustomTextThemeDefinition of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomTextThemeDefinition(
      isDark ? CustomTextColor.warmGrey : CustomTextColor.charcoal,
    );
  }
}

class CustomTextColor {
  const CustomTextColor(
    this.primaryTextColor,
    this.black,
    this.dark,
    this.medium,
    this.light,
    this.extraLight,
    this.fog,
  );

  final Color primaryTextColor;
  final Color black;
  final Color dark;
  final Color medium;
  final Color light;
  final Color extraLight;
  final Color fog;

  static const charcoal = CustomTextColor(
    CustomColors.charcoalBlack,
    CustomColors.charcoalBlack,
    CustomColors.charcoalDark,
    CustomColors.charcoalMedium,
    CustomColors.charcoalLight,
    CustomColors.charcoalLight,
    CustomColors.charcoalLight,
  );

  static const warmGrey = CustomTextColor(
    CustomColors.warmGreyFog,
    CustomColors.warmGreyDark,
    CustomColors.warmGreyDark,
    CustomColors.warmGreyMedium,
    CustomColors.warmGreyLight,
    CustomColors.warmGreyExtraLight,
    CustomColors.warmGreyFog,
  );
}

class CustomTextStyle extends TextStyle {
  factory CustomTextStyle(
    TextStyle textStyle,
    CustomTextColor textColor,
  ) =>
      CustomTextStyle._(
        fontSize: textStyle.fontSize,
        height: textStyle.height,
        letterSpacing: textStyle.letterSpacing,
        fontWeight: textStyle.fontWeight,
        color: textColor.primaryTextColor,
        textColor: textColor,
      );

  const CustomTextStyle._({
    double? fontSize,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    TextLeadingDistribution? leadingDistribution,
    required this.textColor,
  }) : super(
          fontSize: fontSize,
          height: height,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color,
          leadingDistribution: leadingDistribution,
        );

  final CustomTextColor textColor;

  CustomTextStyle get black => _copyWith(color: textColor.black);

  CustomTextStyle get dark => _copyWith(color: textColor.dark);

  CustomTextStyle get medium => _copyWith(color: textColor.medium);

  CustomTextStyle get light => _copyWith(color: textColor.light);

  CustomTextStyle get extraLight => _copyWith(color: textColor.extraLight);

  CustomTextStyle get fog => _copyWith(color: textColor.fog);

  CustomTextStyle get bold => _copyWith(fontWeight: FontWeight.bold);

  CustomTextStyle get thin => _copyWith(fontWeight: FontWeight.w300);

  CustomTextStyle get dense => _copyWith(height: 1);

  CustomTextStyle get centerVertical => _copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      );

  CustomTextStyle withColor(Color color) => _copyWith(color: color);

  CustomTextStyle withLineHeight(double lineHeight) =>
      _copyWith(height: lineHeight / fontSize!);

  CustomTextStyle _copyWith({
    Color? color,
    FontWeight? fontWeight,
    double? height,
    String? fontFamily,
    TextLeadingDistribution? leadingDistribution,
  }) =>
      CustomTextStyle._(
        fontSize: fontSize,
        height: height ?? this.height,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        color: color ?? this.color,
        textColor: textColor,
        fontFamily: fontFamily ?? this.fontFamily,
        leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      );
}

class CustomTextThemeDefinition {
  const CustomTextThemeDefinition(this.colorScheme);

  CustomTextThemeDefinition.charcoal({
    this.colorScheme = CustomTextColor.charcoal,
  });

  CustomTextThemeDefinition.warmGrey({
    this.colorScheme = CustomTextColor.warmGrey,
  });

  final CustomTextColor colorScheme;

  CustomTextStyle get headline1 => CustomTextStyle(_headline1, colorScheme);

  static final _textTheme = TextTheme(
    headline1: _headline1.copyWith(fontWeight: FontWeight.bold),
  );

  static final darkTextTheme = _textTheme.apply(
    displayColor: CustomColors.warmGreyFog,
  );

  static final lightTextTheme = _textTheme.apply(
    displayColor: CustomColors.charcoalBlack,
  );

  static const _headline1 = TextStyle(
    fontSize: 30,
    height: 40 / 30,
    letterSpacing: 30 * 0.02,
    fontWeight: FontWeight.w400,
  );
}
