import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/utils/extensions/extensions.dart';

@immutable
final class AnimatedCircleCheck extends StatefulWidget {
  const AnimatedCircleCheck({
    super.key,
    required this.onChanged,
  });

  final void Function(TodoActivity value) onChanged;

  @override
  State<AnimatedCircleCheck> createState() => _AnimatedCircleCheckState();
}

final class _AnimatedCircleCheckState extends State<AnimatedCircleCheck>
    with SingleTickerProviderStateMixin {
  late TodoActivity _activity;

  @override
  void initState() {
    super.initState();
    _activity = TodoActivity.completed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activity = _activity.reverse;
          widget.onChanged(_activity);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _activity.boolValue
              ? Colors.green.shade400
              : context.colorScheme.background,
          border: Border.all(
            color: _activity.boolValue
                ? Colors.green.shade400
                : context.colorScheme.onBackground.withOpacity(.4),
          ),
        ),
        child: _activity.boolValue
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
