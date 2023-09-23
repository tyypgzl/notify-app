import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return BlocListener<TodoBloc, TodoState>(
      listenWhen: (previous, current) =>
          previous.snackBarInfo != current.snackBarInfo,
      listener: (context, loginState) {
        if (loginState.snackBarInfo.showSnackBar) {
          showSnackBar(
            context: context,
            content: loginState.snackBarInfo.message ?? '',
            type: loginState.snackBarInfo.type,
          );
          context.read<TodoBloc>().add(ResetTodoSnackBar());
        }
      },
      child: Stack(
        children: [
          Scaffold(
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
                  child: state.todos.isNotEmpty
                      ? SlidableAutoCloseBehavior(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            itemCount: state.todos.length,
                            itemBuilder: (context, index) {
                              final todo = state.todos.elementAt(index);
                              return TodoTile(
                                todo: todo,
                                onChanged: (activity) {
                                  context.read<TodoBloc>().add(
                                        TodoActivityChanged(
                                          todo: todo,
                                          activity: activity,
                                        ),
                                      );
                                },
                                onDismissable: () => context
                                    .read<TodoBloc>()
                                    .add(TodoDeleted(todoId: todo.id)),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: const AppPadding.x16(),
                            child: AnimationWidget(
                              asset: Assets.animations.lotNoData,
                            ),
                          ),
                        ),
                );
              },
            ),
            floatingActionButton: const TodoFabButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
          BlocBuilder<TodoBloc, TodoState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            builder: (context, state) =>
                LoadingWidget(isLoading: state.isLoading),
          ),
        ],
      ),
    );
  }
}
