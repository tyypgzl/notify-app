import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
final class AdaptiveTile extends StatelessWidget {
  const AdaptiveTile({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.subtitle,
  });

  final Widget title;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoListTile(
        title: title,
        leading: leading,
        trailing: trailing,
        subtitle: subtitle,
        onTap: onTap,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      );
    } else {
      return ListTile(
        title: title,
        leading: leading,
        trailing: trailing,
        subtitle: subtitle,
        onTap: onTap,
      );
    }
  }
}
