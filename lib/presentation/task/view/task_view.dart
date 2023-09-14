import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
@immutable
final class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Task'),
      ),
    );
  }
}
