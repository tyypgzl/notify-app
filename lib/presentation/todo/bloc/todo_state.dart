part of 'todo_bloc.dart';

enum TodoStatus {
  loading,
  success,
  error;
}

final class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.loading,
    this.filter = TodoFilter.all,
    this.todos = const [],
    this.snackBarInfo = const SnackBarInfo.init(),
  });

  const TodoState.init() : this();

  final TodoStatus status;
  final TodoFilter filter;
  final List<TodoModel> todos;
  final SnackBarInfo snackBarInfo;

  bool get isLoading => status == TodoStatus.loading;

  @override
  List<Object> get props => [status, filter, todos, snackBarInfo];

  TodoState copyWith({
    TodoStatus? status,
    TodoFilter? filter,
    List<TodoModel>? todos,
    SnackBarInfo? snackBarInfo,
  }) {
    return TodoState(
      status: status ?? this.status,
      filter: filter ?? this.filter,
      todos: todos ?? this.todos,
      snackBarInfo: snackBarInfo ?? this.snackBarInfo,
    );
  }
}
