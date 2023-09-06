import 'package:flutter/cupertino.dart';

extension WidgetX on Widget {
  Widget get pagePadding => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: this,
      );
}
