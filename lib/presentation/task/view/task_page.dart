import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/presentation/task/task.dart';

@RoutePage()
@immutable
final class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskView();
  }
}
