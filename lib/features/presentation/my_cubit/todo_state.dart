import 'package:custom_statemanagement_todo/features/model/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  TodoLoadedState({
    required this.todoModel
  });
  final List<TodoModel> todoModel;
  @override
  List<Object?> get props => [todoModel];
}

class TodoAddedState extends TodoState {
  TodoAddedState();
  @override
  List<Object?> get props => [];
}

class TodoDeletedState extends TodoState {
  TodoDeletedState();
  @override
  List<Object?> get props => [];
}

class TodoErrorState extends TodoState {
  TodoErrorState({required this.error});
  final String error;
  @override
  List<Object?> get props => [error];
}
