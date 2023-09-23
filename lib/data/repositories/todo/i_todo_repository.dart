import 'package:notify/data/models/todo/todo.dart';

abstract interface class ITodoRepository {
  Future<TodoResponse> addTodo(TodoModel todo);
  Future<TodoResponse> deleteTodo(String? id);
  Future<TodoResponse> updateTodo(TodoModel todo);
  Future<TodoGetAllResponse> getAllTodo(TodoFilter filter);
}
