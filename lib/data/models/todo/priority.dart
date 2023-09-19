import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/context_extension.dart';

enum TodoPriority {
  veryHigh,
  high,
  medium,
  low,
  veryLow;

  String toLocalize(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case TodoPriority.veryHigh:
        return l10n.enumTodoPriorityVeryHigh;
      case TodoPriority.high:
        return l10n.enumTodoPriorityHigh;
      case TodoPriority.medium:
        return l10n.enumTodoPriorityMedium;
      case TodoPriority.low:
        return l10n.enumTodoPriorityLow;
      case TodoPriority.veryLow:
        return l10n.enumTodoPriorityVeryLow;
    }
  }
}
