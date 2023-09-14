import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/presentation/settings/settings.dart';

@RoutePage()
@immutable
final class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}
