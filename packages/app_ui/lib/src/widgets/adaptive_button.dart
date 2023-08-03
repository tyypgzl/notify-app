import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    super.key,
    required this.child,
    this.backgroundColor,
    required this.onPressed,
    this.padding,
    this.borderRadius,
    this.disableColor,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? disableColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS || Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        disabledColor: disableColor ?? Theme.of(context).disabledColor,
        padding: padding ?? EdgeInsets.zero,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        pressedOpacity: .5,
        child: child,
      );
    } else {
      return MaterialButton(
        onPressed: onPressed,
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        elevation: 0,
        disabledColor: disableColor ?? Theme.of(context).disabledColor,
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: child,
      );
    }
  }
}
