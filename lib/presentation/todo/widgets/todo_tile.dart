import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {},
      child: AdaptiveTile(
        leading: const AnimatedCircleCheck(
          onChanged: print,
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
    );
  }
}
