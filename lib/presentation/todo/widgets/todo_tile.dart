import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
    this.onChanged,
    this.onTap,
    this.onDismissable,
  });

  final TodoModel todo;
  final ValueSetter<TodoActivity>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onDismissable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Slidable(
        key: ValueKey(todo.id),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () => onDismissable?.call(),
          ),
          extentRatio: .25,
          children: [
            SlidableAction(
              onPressed: (context) {
                onDismissable?.call();
                Slidable.of(context)?.close();
              },
              backgroundColor: context.colorScheme.error,
              foregroundColor: context.colorScheme.onError,
              icon: FontAwesomeIcons.trash,
            ),
          ],
        ),
        child: AdaptiveTile(
          leading: AnimatedCircleCheck(
            onChanged: onChanged,
            activity: todo.activity ?? TodoActivity.waiting,
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (todo.createdTime ?? DateTime.now()).dayNumberFormat,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                (todo.createdTime ?? DateTime.now()).month3LetterFormat,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onBackground,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          title: Text(
            todo.title ?? '',
          ),
          subtitle: Text(
            todo.description ?? '',
          ),
        ),
      ),
    );
  }
}
