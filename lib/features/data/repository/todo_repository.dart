import 'package:custom_statemanagement_todo/features/data/data_source/local_data_source.dart';

import '../../model/todo_model.dart';

abstract class TodoRepository {
  Future<bool> addTodo(TodoModel todo);
  Future<List<TodoModel>> getTodoList();
  Future<bool> deleteTodo(String todoId);
}

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({required TodoDataSource todoDataSource})
      : _todoDataSource = todoDataSource;
  final TodoDataSource _todoDataSource;
  
  @override
  Future<bool> addTodo(TodoModel todo) => _todoDataSource.addTodo(todo);

  @override
  Future<bool> deleteTodo(String todoId) => _todoDataSource.deleteTodo(todoId);

  @override
  Future<List<TodoModel>> getTodoList() => _todoDataSource.getTodoList();
}
