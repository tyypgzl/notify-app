import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/presentation/todo/todo.dart';

@immutable
final class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TodoBloc>().add(const TodosFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              final refreshCompleter = Completer<void>();
              context.read<TodoBloc>().add(
                    TodosFetched(
                      refreshCompleter: refreshCompleter,
                    ),
                  );
              await refreshCompleter.future;
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: state.todos.elementAt(index),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: const TodoFabButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
