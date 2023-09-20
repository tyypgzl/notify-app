import 'package:cookie_client/cookie_client.dart';
import 'package:notify/data/data_source/todo/i_todo_data_source.dart';
import 'package:notify/data/models/todo/filter.dart';
import 'package:notify/data/models/todo/get_all_response.dart';
import 'package:notify/data/models/todo/todo_model.dart';
import 'package:notify/data/models/todo/todo_response.dart';
import 'package:notify/data/repositories/todo/i_todo_repository.dart';
import 'package:notify/utils/exception/notify_exception.dart';

final class TodoRepository implements ITodoRepository {
  const TodoRepository({
    required ITodoDataSource dataSource,
  }) : _dataSource = dataSource;

  final ITodoDataSource _dataSource;

  @override
  Future<TodoResponse> addTodo(TodoModel todo) async {
    try {
      final result = await _dataSource.addTodo(todo);
      return result;
    } on CookieException catch (error, stackTrace) {
      Error.throwWithStackTrace(NotifyException.fromCookie(error), stackTrace);
    }
  }

  @override
  Future<TodoResponse> deleteTodo(TodoModel todo) {
    throw UnimplementedError();
  }

  @override
  Future<TodoGetAllResponse> getAllTodo(TodoFilter filter) {
    throw UnimplementedError();
  }

  @override
  Future<TodoResponse> updateTodo(TodoModel todo) {
    throw UnimplementedError();
  }
}
