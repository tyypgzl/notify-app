import 'package:cookie_client/cookie_client.dart';
import 'package:notify/data/models/todo/todo.dart';

final class TodoGetAllResponse
    implements CookieNetworkModel<TodoGetAllResponse> {
  const TodoGetAllResponse({
    this.todos,
    this.message,
    this.status,
  });

  factory TodoGetAllResponse.fromJson(Map<String, dynamic> json) {
    return TodoGetAllResponse(
      todos: (json['todos'] as List<dynamic>?)
          ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
  final List<TodoModel>? todos;
  final String? message;
  final int? status;

  TodoGetAllResponse copyWith({
    List<TodoModel>? todos,
    String? message,
    int? status,
  }) {
    return TodoGetAllResponse(
      todos: todos ?? this.todos,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'todos': todos,
      'message': message,
      'status': status,
    };
  }

  @override
  String toString() =>
      'TodoGetAllResponse(todos: $todos,message: $message,status: $status)';

  @override
  TodoGetAllResponse fromJson(Map<String, dynamic> json) =>
      TodoGetAllResponse.fromJson(json);
}
