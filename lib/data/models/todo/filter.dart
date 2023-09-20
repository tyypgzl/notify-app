import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

enum TodoFilter {
  all,
  active,
  completed;

  String toLocalize(BuildContext context) {
    switch (this) {
      case TodoFilter.active:
        return context.l10n.enumTodoFilterActive;
      case TodoFilter.all:
        return context.l10n.enumTodoFilterAll;
      case TodoFilter.completed:
        return context.l10n.enumTodoFilterCompleted;
    }
  }
}
