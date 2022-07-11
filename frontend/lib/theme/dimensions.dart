import 'package:flutter/material.dart';

class CustomDimensions {
  static const double screenPaddingValue = 32;
  static const double appBarHeight = 48;
  static const double standardPaddingValue = 24;
  static const double buttonHeight = 56;

  static const EdgeInsets screenPadding = EdgeInsets.all(screenPaddingValue);

  static const EdgeInsets horizontalScreenPadding = EdgeInsets.symmetric(
    horizontal: screenPaddingValue,
  );

  static const EdgeInsets standardHorizontalPadding = EdgeInsets.symmetric(
    horizontal: standardPaddingValue,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(standardPaddingValue);
}
