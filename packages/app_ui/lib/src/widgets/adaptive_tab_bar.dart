import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTabBar extends StatelessWidget {
  const AdaptiveTabBar({
    required this.currentIndex,
    required this.items,
    super.key,
    this.onTap,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
  });

  final void Function(int)? onTap;
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS || Platform.isIOS) {
      return CupertinoTabBar(
        height: kBottomNavigationBarHeight,
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
        backgroundColor: backgroundColor,
        activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
        inactiveColor: inactiveColor ?? Theme.of(context).disabledColor,
      );
    } else {
      return BottomNavigationBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: backgroundColor,
        selectedItemColor: activeColor ?? Theme.of(context).colorScheme.primary,
        unselectedItemColor: inactiveColor ?? Theme.of(context).disabledColor,
      );
    }
  }
}
