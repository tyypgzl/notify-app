import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
@immutable
final class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Todo'),
      ),
    );
  }
}
