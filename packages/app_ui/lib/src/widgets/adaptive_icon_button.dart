import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class AdaptiveIconButton extends StatelessWidget {
  const AdaptiveIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.size,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      );
    } else {
      return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      );
    }
  }
}
