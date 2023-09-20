part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class FilterSheetOpened extends TodoEvent {
  const FilterSheetOpened({required this.onSheetOpened});

  final AsyncValueGetter<TodoFilter?> onSheetOpened;
}

final class AddTodoSheetOpened extends TodoEvent {
  const AddTodoSheetOpened({required this.onSheetOpened});

  final AsyncValueGetter<TodoModel?> onSheetOpened;
}

final class TodosFetched extends TodoEvent {
  const TodosFetched({this.refreshCompleter});

  final Completer<void>? refreshCompleter;
}
