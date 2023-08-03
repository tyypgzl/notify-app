import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin SafeState<T extends StatefulWidget> on State<T> {
  FutureOr<void> asyncSafeContext(AsyncCallback voidCallback) async {
    if (mounted) {
      await voidCallback.call();
    }
  }

  void safeContext(VoidCallback voidCallback) {
    if (mounted) {
      voidCallback.call();
    }
  }
}
