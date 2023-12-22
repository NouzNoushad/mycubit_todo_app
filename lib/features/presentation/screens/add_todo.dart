import 'package:custom_statemanagement_todo/features/model/todo_model.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_cubit.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_state.dart';
import 'package:custom_statemanagement_todo/utils/constant.dart';
import 'package:custom_statemanagement_todo/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/colors.dart';
import '../widgets/text_form_field.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, this.todo, this.todoType = TodoType.add});
  final TodoModel? todo;
  final TodoType todoType;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    if (widget.todoType == TodoType.update) {
      titleController.text = widget.todo?.title ?? "";
      descriptionController.text = widget.todo?.description ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorPicker.backgroundColor,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ColorPicker.whiteColor,
          onPressed: () {
            if (widget.todoType == TodoType.update) {
              final TodoModel todoModel = TodoModel(
                id: widget.todo?.id ?? "",
                title: titleController.text,
                description: descriptionController.text,
              );
              context.of<TodoMyCubit, TodoState>().addTodo(todoModel);
              context.showToast('Todo updated Successfully');
              Navigator.pop(context);
            } else {
              if (titleController.text != "" ||
                  descriptionController.text != "") {
                final TodoModel todoModel = TodoModel(
                  id: const Uuid().v4(),
                  title: titleController.text,
                  description: descriptionController.text,
                );
                context.of<TodoMyCubit, TodoState>().addTodo(todoModel);
                context.showToast('Todo added Successfully');
                Navigator.pop(context);
              }
            }
          },
          label: Text(
            widget.todoType == TodoType.update ? "Update Todo" : 'Add Todo',
            style: TextStyle(
              color: ColorPicker.backgroundColor,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TodoTextFormField(
              controller: titleController,
              hintText: widget.todoType == TodoType.update
                  ? widget.todo?.title ?? ""
                  : 'Title',
            ),
            const SizedBox(
              height: 10,
            ),
            TodoTextFormField(
              controller: descriptionController,
              hintText: widget.todoType == TodoType.update
                  ? widget.todo?.description ?? ""
                  : 'Description',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
