import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/utils/router/app_router.dart';

@immutable
final class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TodoRoute(),
        TaskRoute(),
        NoteRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return AdaptiveTabBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.checkDouble, size: 25),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cubesStacked, size: 25),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.noteSticky, size: 25),
              label: 'Note',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear, size: 25),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
