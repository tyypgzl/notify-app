import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class SettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.l10n.settingTitle),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
