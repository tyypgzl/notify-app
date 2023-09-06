import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension ContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  double get viewPaddingTop => MediaQuery.viewPaddingOf(this).top;

  double get viewPaddingBottom => MediaQuery.viewPaddingOf(this).bottom;

  double get viewPaddingVertical => MediaQuery.viewPaddingOf(this).vertical;

  ThemeData get appTheme => Theme.of(this);

  Brightness get appBrightness => MediaQuery.platformBrightnessOf(this);

  double get textScaleFactor => MediaQuery.textScaleFactorOf(this);
}

extension MediaQueryX on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  double dynamicWidth(double val) => width * val;

  double dynamicHeight(double val) => height * val;
}
