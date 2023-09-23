import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:notify/data/models/todo/todo.dart';
import 'package:notify/data/repositories/todo/todo.dart';
import 'package:notify/utils/exception/notify_exception.dart';

part 'todo_event.dart';
part 'todo_state.dart';

final class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required ITodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(const TodoState.init()) {
    on<TodosFetched>(_onTodosFetched);
    on<FilterSheetOpened>(_onFilterSheetOpened);
    on<AddTodoSheetOpened>(_onAddTodoSheetOpened);
    on<TodoActivityChanged>(_onTodoActivityChanged);
    on<TodoDeleted>(_onTodoDeleted);
    on<ResetTodoSnackBar>(_onResetTodoSnackBar);
  }

  final ITodoRepository _todoRepository;

  FutureOr<void> _onTodosFetched(
    TodosFetched event,
    Emitter<TodoState> emit,
  ) async {
    try {
      emit(state.copyWith(status: TodoStatus.loading));
      final response = await _todoRepository.getAllTodo(state.filter);
      event.refreshCompleter?.complete();
      emit(
        state.copyWith(
          todos: response.todos,
          status: TodoStatus.success,
        ),
      );
    } on NotifyException catch (error, stackTrace) {
      event.refreshCompleter?.completeError(error, stackTrace);
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onFilterSheetOpened(
    FilterSheetOpened event,
    Emitter<TodoState> emit,
  ) async {
    final result = await event.onSheetOpened();
    emit(state.copyWith(filter: result));
    add(const TodosFetched());
  }

  FutureOr<void> _onAddTodoSheetOpened(
    AddTodoSheetOpened event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final result = await event.onSheetOpened();
      if (result != null) {
        final response = await _todoRepository.addTodo(result);
        if (response.status == 200 || response.message == 'success') {
          final newList = List.of(state.todos)..add(result);
          emit(state.copyWith(todos: newList));
        }
      }
    } on NotifyException catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onTodoActivityChanged(
    TodoActivityChanged event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final todo = event.todo.copyWith(activity: event.activity);
      await _todoRepository.updateTodo(todo);

      add(const TodosFetched());
    } on NotifyException catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onTodoDeleted(
    TodoDeleted event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final result = await _todoRepository.deleteTodo(event.todoId);
      if (result.status == 200 && result.message == 'success') {
        add(const TodosFetched());
      }

      add(const TodosFetched());
    } on NotifyException catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onResetTodoSnackBar(
    ResetTodoSnackBar event,
    Emitter<TodoState> emit,
  ) {
    emit(
      state.copyWith(
        snackBarInfo: const SnackBarInfo.init(),
      ),
    );
  }
}
