import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/localization/localization.dart';
import 'package:notify/utils/extensions/extensions.dart';

@RoutePage<Locale>()
@immutable
final class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: SettingsTile(
        padding: const AppPadding.zero(),
        subTiles: [
          SubSettingTile(
            showBottomDivider: false,
            title: 'English',
            titleStyle: context.textTheme.titleMedium,
            padding: const AppPadding.y8(),
            onTap: () => context.popRoute(L10n.en),
          ),
          SubSettingTile(
            showBottomDivider: false,
            title: 'Türkçe',
            padding: const AppPadding.y8(),
            titleStyle: context.textTheme.titleMedium,
            onTap: () => context.popRoute(L10n.tr),
          ),
        ],
      ),
    );
  }
}
