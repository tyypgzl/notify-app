import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/filter.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.l10n.todoTitle),
      actions: [
        AdaptiveIconButton(
          onPressed: () async {
            // TODO(tyypgzl): add to bloc
            await showModalBottomSheet<dynamic>(
              context: context,
              builder: (context) {
                return const FilterSheetWidget(
                  filter: TodoFilter.all,
                );
              },
            );
          },
          icon: FontAwesomeIcons.filter,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
