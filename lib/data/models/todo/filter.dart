import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

enum TodoFilter {
  all,
  waiting,
  done;

  String toLocalize(BuildContext context) {
    switch (this) {
      case TodoFilter.waiting:
        return context.l10n.enumTodoFilterWaiting;
      case TodoFilter.all:
        return context.l10n.enumTodoFilterAll;
      case TodoFilter.done:
        return context.l10n.enumTodoFilterDone;
    }
  }

  String get toPath {
    switch (this) {
      case TodoFilter.all:
        return '0';
      case TodoFilter.waiting:
        return '1';
      case TodoFilter.done:
        return '2';
    }
  }
}
