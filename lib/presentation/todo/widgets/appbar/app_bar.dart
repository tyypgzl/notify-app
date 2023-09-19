import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/filter.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    return AppBar(
      title: Text(context.l10n.todoTitle),
      actions: [
        AdaptiveIconButton(
          onPressed: () {
            todoBloc.add(
              FilterSheetOpened(
                onSheetOpened: () => showModalBottomSheet<TodoFilter>(
                  context: context,
                  showDragHandle: true,
                  builder: (context) {
                    return FilterSheetWidget(
                      filter: todoBloc.state.filter,
                    );
                  },
                ),
              ),
            );
          },
          icon: FontAwesomeIcons.filter,
          color: context.colorScheme.onPrimary,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
