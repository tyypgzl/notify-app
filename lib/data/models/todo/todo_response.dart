import 'package:cookie_client/cookie_client.dart';

final class TodoResponse implements CookieNetworkModel<TodoResponse> {
  const TodoResponse({
    this.message,
    this.status,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
  final String? message;
  final int? status;

  TodoResponse copyWith({
    String? message,
    int? status,
  }) {
    return TodoResponse(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
    };
  }

  @override
  String toString() => 'AddTodoResponse(message: $message,status: $status)';

  @override
  TodoResponse fromJson(Map<String, dynamic> json) =>
      TodoResponse.fromJson(json);
}
