import 'package:custom_statemanagement_todo/config/routes/page_navigation.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_cubit.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_state.dart';
import 'package:custom_statemanagement_todo/state_management/my_cubit_builder.dart';
import 'package:custom_statemanagement_todo/utils/colors.dart';
import 'package:custom_statemanagement_todo/utils/constant.dart';
import 'package:custom_statemanagement_todo/utils/extension.dart';
import 'package:flutter/material.dart';

import 'add_todo.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPicker.whiteColor,
        onPressed: () {
          Navigator.of(context).push(CustomPageTransition(
              child: const AddTodoScreen(),
              type: PageTransitionType.bottomToTop));
        },
        child: Icon(
          Icons.add,
          color: ColorPicker.backgroundColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorPicker.backgroundColor,
        title: const Text('Todo List'),
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: MyCubitBuilder<TodoMyCubit, TodoState>(builder: (context, state) {
        if (state is TodoLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: ColorPicker.backgroundColor,
              color: ColorPicker.whiteColor,
            ),
          );
        }
        if (state is TodoLoadedState) {
          if (state.todoModel.isEmpty) {
            return const Center(
              child: Text('Add New Todo'),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                final todoModel = state.todoModel[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(CustomPageTransition(
                        child: AddTodoScreen(
                          todo: todoModel,
                          todoType: TodoType.update,
                        ),
                        type: PageTransitionType.bottomToTop));
                  },
                  tileColor: ColorPicker.tileColor,
                  title: Text(todoModel.title ?? ""),
                  subtitle: Text(todoModel.description ?? ""),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .of<TodoMyCubit, TodoState>()
                            .deleteTodo(todoModel.id ?? "");
                        context.showToast('Todo deleted successfully');
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: state.todoModel.length);
        }
        return Container();
      }),
    );
  }
}
