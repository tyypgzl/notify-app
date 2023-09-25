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
        title: Text(context.l10n.settingsTheme),
      ),
      body: SettingsTile(
        padding: const AppPadding.zero(),
        subTiles: [
          SubSettingTile(
            showBottomDivider: false,
            title: context.l10n.settingsThemeDark,
            titleStyle: context.textTheme.titleMedium,
            padding: const AppPadding.y8(),
            onTap: () => context.popRoute(ThemeMode.dark),
          ),
          SubSettingTile(
            showBottomDivider: false,
            title: context.l10n.settingsThemeLight,
            padding: const AppPadding.y8(),
            titleStyle: context.textTheme.titleMedium,
            onTap: () => context.popRoute(ThemeMode.light),
          ),
          SubSettingTile(
            showBottomDivider: false,
            title: context.l10n.settingsThemeSystem,
            padding: const AppPadding.y8(),
            titleStyle: context.textTheme.titleMedium,
            onTap: () => context.popRoute(ThemeMode.system),
          ),
        ],
      ),
    );
  }
}
