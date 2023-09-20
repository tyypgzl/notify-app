import 'package:notify/data/models/todo/todo.dart';

abstract interface class ITodoDataSource {
  Future<TodoResponse> addTodo(TodoModel todo);
  Future<TodoResponse> deleteTodo(TodoModel todo);
  Future<TodoResponse> updateTodo(TodoModel todo);
  Future<TodoGetAllResponse> getAllTodo(TodoFilter filter);
}
