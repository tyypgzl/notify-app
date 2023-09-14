import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notify/presentation/todo/todo.dart';

@RoutePage()
@immutable
final class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodoView();
  }
}
