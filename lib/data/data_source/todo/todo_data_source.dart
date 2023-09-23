import 'package:cookie_client/cookie_client.dart';
import 'package:notify/data/data_source/todo/i_todo_data_source.dart';
import 'package:notify/data/models/todo/filter.dart';
import 'package:notify/data/models/todo/get_all_response.dart';
import 'package:notify/data/models/todo/todo_model.dart';
import 'package:notify/data/models/todo/todo_response.dart';
import 'package:notify/utils/constants/constants.dart';

final class TodoDataSource implements ITodoDataSource {
  const TodoDataSource({
    required CookieClient client,
  }) : _client = client;

  final CookieClient _client;

  @override
  Future<TodoResponse> addTodo(TodoModel todo) {
    return _client.post<TodoResponse, TodoResponse>(
      ConstAPI.addTodo,
      responseModel: const TodoResponse(),
      data: todo.toJson(),
    );
  }

  @override
  Future<TodoResponse> deleteTodo(String? id) {
    return _client.delete<TodoResponse, TodoResponse>(
      '${ConstAPI.deleteTodo}/$id',
      responseModel: const TodoResponse(),
    );
  }

  @override
  Future<TodoGetAllResponse> getAllTodo(TodoFilter filter) {
    return _client.get<TodoGetAllResponse, TodoGetAllResponse>(
      '${ConstAPI.getAllTodo}?activity=${filter.index}',
      responseModel: const TodoGetAllResponse(),
    );
  }

  @override
  Future<TodoResponse> updateTodo(TodoModel todo) {
    return _client.put<TodoResponse, TodoResponse>(
      ConstAPI.updateTodo,
      data: todo.toJson(),
      responseModel: const TodoResponse(),
    );
  }
}
