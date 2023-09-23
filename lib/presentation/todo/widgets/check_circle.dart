import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class AnimatedCircleCheck extends StatelessWidget {
  const AnimatedCircleCheck({
    super.key,
    required this.onChanged,
    required this.activity,
  });

  final ValueSetter<TodoActivity>? onChanged;
  final TodoActivity activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(activity.reverse),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activity.boolValue
              ? Colors.green.shade400
              : context.colorScheme.background,
          border: Border.all(
            color: activity.boolValue
                ? Colors.green.shade400
                : context.colorScheme.onBackground.withOpacity(.4),
          ),
        ),
        child: activity.boolValue
            ? const Center(
                child: Icon(
                  FontAwesomeIcons.check,
                  size: 18,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
