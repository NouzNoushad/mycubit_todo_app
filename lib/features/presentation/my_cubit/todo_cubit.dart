import 'package:custom_statemanagement_todo/features/data/repository/todo_repository.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_state.dart';
import 'package:custom_statemanagement_todo/state_management/my_cubit.dart';

import '../../model/todo_model.dart';

class TodoMyCubit extends MyCubit<TodoState> {
  TodoMyCubit({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoInitialState()) {
    getTodoList();
  }
  final TodoRepository _todoRepository;

  getTodoList() async {
    try {
      emit(TodoLoadingState());
      List<TodoModel> todoList = await _todoRepository.getTodoList();
      emit(TodoLoadedState(todoModel: todoList));
    } catch (error) {
      emit(TodoErrorState(error: error.toString()));
    }
  }

  addTodo(TodoModel todo) async {
    try {
      await _todoRepository.addTodo(todo);
      getTodoList();
      emit(TodoAddedState());
    } catch (error) {
      emit(TodoErrorState(error: error.toString()));
    }
  }

  deleteTodo(String todoId) async {
    try {
      await _todoRepository.deleteTodo(todoId);
      getTodoList();
      emit(TodoDeletedState());
    } catch (error) {
      emit(TodoErrorState(error: error.toString()));
    }
  }
}
