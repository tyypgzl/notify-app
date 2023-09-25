import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/router/app_router.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TodoRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return AdaptiveTabBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.checkDouble, size: 25),
              label: context.l10n.todoTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.gear, size: 25),
              label: context.l10n.settingsTitle,
            ),
          ],
        );
      },
    );
  }
}
