import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/utils/extensions/extensions.dart';

@RoutePage<ThemeMode>()
@immutable
final class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: SettingsTile(
        padding: const AppPadding.zero(),
        subTiles: [
          SubSettingTile(
            showBottomDivider: false,
            title: 'Dark',
            titleStyle: context.textTheme.titleMedium,
            padding: const AppPadding.y8(),
            onTap: () => context.popRoute(ThemeMode.dark),
          ),
          SubSettingTile(
            showBottomDivider: false,
            title: 'Light',
            padding: const AppPadding.y8(),
            titleStyle: context.textTheme.titleMedium,
            onTap: () => context.popRoute(ThemeMode.light),
          ),
          SubSettingTile(
            showBottomDivider: false,
            title: 'System',
            padding: const AppPadding.y8(),
            titleStyle: context.textTheme.titleMedium,
            onTap: () => context.popRoute(ThemeMode.system),
          ),
        ],
      ),
    );
  }
}
