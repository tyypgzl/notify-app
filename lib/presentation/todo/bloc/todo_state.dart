part of 'todo_bloc.dart';

enum TodoStatus {
  loading,
  success,
  error;
}

final class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.success,
    this.filter = TodoFilter.all,
    this.todos = const [],
  });

  const TodoState.init() : this();

  final TodoStatus status;
  final TodoFilter filter;
  final List<TodoModel> todos;

  @override
  List<Object> get props => [status, filter, todos];

  TodoState copyWith({
    TodoStatus? status,
    TodoFilter? filter,
    List<TodoModel>? todos,
  }) {
    return TodoState(
      status: status ?? this.status,
      filter: filter ?? this.filter,
      todos: todos ?? this.todos,
    );
  }
}
