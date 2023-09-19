import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class TodoFabButton extends StatelessWidget {
  const TodoFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      elevation: 0,
      highlightElevation: 0,
      splashColor: context.colorScheme.primaryContainer,
      backgroundColor: context.colorScheme.primaryContainer,
      onPressed: () {
        context.read<TodoBloc>().add(
              AddTodoSheetOpened(
                onSheetOpened: () => showModalBottomSheet<TodoModel>(
                  context: context,
                  isScrollControlled: true,
                  showDragHandle: true,
                  builder: (context) => const AddTodoWidgetSheet(),
                ),
              ),
            );
      },
      child: Icon(
        FontAwesomeIcons.plus,
        color: context.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
