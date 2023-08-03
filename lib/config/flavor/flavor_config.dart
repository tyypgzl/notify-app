import 'package:flutter/material.dart';
import 'package:notify/utils/enum/flavor.dart';

class FlavorConfig extends InheritedWidget {
  const FlavorConfig({
    super.key,
    required super.child,
    required this.flavor,
  });

  final Flavor flavor;

  static FlavorConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FlavorConfig>();

  @override
  bool updateShouldNotify(covariant FlavorConfig oldWidget) =>
      flavor != oldWidget.flavor;
}
