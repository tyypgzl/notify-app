import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:notify/data/models/todo/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

final class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState.init()) {
    on<TodosFetched>(_onTodosFetched);
    on<FilterSheetOpened>(_onFilterSheetOpened);
    on<AddTodoSheetOpened>(_onAddTodoSheetOpened);
  }

  FutureOr<void> _onTodosFetched(
    TodosFetched event,
    Emitter<TodoState> emit,
  ) {
    final todos = <TodoModel>[
      TodoModel(
        activity: TodoActivity.active,
        colorNumber: 0,
        createdTime: DateTime.now(),
        description: 'Desc1',
        id: '1',
        title: 'Title1',
      ),
      TodoModel(
        activity: TodoActivity.active,
        colorNumber: 1,
        createdTime: DateTime.now(),
        description: 'Desc2',
        id: '2',
        title: 'Title2',
      ),
    ];
    emit(
      state.copyWith(
        todos: todos,
      ),
    );
  }

  FutureOr<void> _onFilterSheetOpened(
    FilterSheetOpened event,
    Emitter<TodoState> emit,
  ) async {
    final result = await event.onSheetOpened();
    emit(state.copyWith(filter: result));
  }

  FutureOr<void> _onAddTodoSheetOpened(
    AddTodoSheetOpened event,
    Emitter<TodoState> emit,
  ) async {
    final result = await event.onSheetOpened();
    if (result != null) {
      final newList = List.of(state.todos)..add(result);
      emit(state.copyWith(todos: newList));
    }
  }
}
