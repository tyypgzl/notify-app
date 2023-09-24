import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
final class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    super.key,
    required this.child,
    this.backgroundColor,
    required this.onPressed,
    this.elevation = 0,
  });

  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS || Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        color: backgroundColor ?? Theme.of(context).colorScheme.background,
        padding: EdgeInsets.zero,
        pressedOpacity: .5,
        child: child,
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Theme.of(context).colorScheme.background,
          ),
          splashFactory: NoSplash.splashFactory,
          elevation: MaterialStateProperty.all(0),
        ),
        child: child,
      );
    }
  }
}
