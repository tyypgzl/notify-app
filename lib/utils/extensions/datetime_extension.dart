import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dateFormat => DateFormat('dd / MMMM / yyyy').format(this);

  String get dateFormatLongWithTime =>
      DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get dateFormatWithTime => DateFormat('dd/MM HH:mm').format(this);

  String get timeFormat => DateFormat(DateFormat.HOUR24_MINUTE).format(this);

  String get month3LetterFormat => DateFormat(DateFormat.MONTH)
      .format(this)
      .characters
      .getRange(0, 3)
      .string
      .toUpperCase();

  String get dayNumberFormat => DateFormat(DateFormat.DAY).format(this);

  String get day3LetterFormat => DateFormat(DateFormat.WEEKDAY)
      .format(this)
      .characters
      .getRange(0, 3)
      .string
      .toUpperCase();
}
