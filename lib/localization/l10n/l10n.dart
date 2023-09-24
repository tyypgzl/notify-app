import 'package:flutter/material.dart';

final class L10n {
  L10n._();

  static const Locale en = Locale.fromSubtags(languageCode: 'en');
  static const Locale tr = Locale.fromSubtags(languageCode: 'tr');

  static const languages = [en, tr];
}
