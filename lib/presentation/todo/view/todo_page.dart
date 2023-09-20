import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/data/repositories/todo/todo.dart';
import 'package:notify/presentation/todo/todo.dart';

@RoutePage()
@immutable
final class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(
        todoRepository: context.read<ITodoRepository>(),
      ),
      child: const TodoView(),
    );
  }
}
