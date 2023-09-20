import 'dart:async';

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
  }

  final ITodoRepository _todoRepository;

  FutureOr<void> _onTodosFetched(
    TodosFetched event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final response = await _todoRepository.getAllTodo(state.filter);
      event.refreshCompleter?.complete();
      emit(
        state.copyWith(
          todos: response.todos,
        ),
      );
    } on NotifyException catch (error, stackTrace) {
      event.refreshCompleter?.completeError(error, stackTrace);
      addError(error, stackTrace);
    }
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
}
