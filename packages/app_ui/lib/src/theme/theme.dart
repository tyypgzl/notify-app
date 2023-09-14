import 'package:app_ui/src/generated/generated.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

@immutable
final class AppTheme {
  const AppTheme._();

  static final light = FlexThemeData.light(
    scheme: FlexScheme.brandBlue,
    appBarStyle: FlexAppBarStyle.primary,
    fontFamily: FontFamily.poppins,
    subThemesData: const FlexSubThemesData(
      inputDecoratorRadius: 4,
      inputDecoratorBorderType: FlexInputBorderType.underline,
    ),
  );

  static final dark = FlexThemeData.dark(
    scheme: FlexScheme.aquaBlue,
    appBarStyle: FlexAppBarStyle.primary,
    fontFamily: FontFamily.poppins,
    subThemesData: const FlexSubThemesData(
      inputDecoratorRadius: 4,
      inputDecoratorBorderType: FlexInputBorderType.underline,
    ),
  );
}
