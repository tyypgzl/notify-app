import 'package:flutter/material.dart';

@immutable
final class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
