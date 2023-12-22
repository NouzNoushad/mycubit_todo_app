import 'package:hive_flutter/hive_flutter.dart';
import '../../../utils/strings.dart';
import '../../model/todo_model.dart';

abstract class TodoDataSource {
  Future<bool> addTodo(TodoModel todo);
  Future<List<TodoModel>> getTodoList();
  Future<bool> deleteTodo(String todoId);
}

class TodoDataSourceImpl extends TodoDataSource {
  final Box<TodoModel> openBox = Hive.box(AppStrings.database);
  @override
  Future<bool> addTodo(TodoModel todo) async {
    openBox.put(todo.id, todo);
    return true;
  }

  @override
  Future<List<TodoModel>> getTodoList() async {
    List<TodoModel> todoList = openBox.values.toList();
    return todoList;
  }

  @override
  Future<bool> deleteTodo(String todoId) async {
    openBox.delete(todoId);
    return true;
  }
}
