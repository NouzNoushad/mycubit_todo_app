import 'package:custom_statemanagement_todo/features/data/data_source/local_data_source.dart';
import 'package:custom_statemanagement_todo/features/data/repository/todo_repository.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_cubit.dart';
import 'package:custom_statemanagement_todo/features/presentation/my_cubit/todo_state.dart';
import 'package:custom_statemanagement_todo/state_management/my_cubit_provider.dart';
import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/route_constant.dart';
import 'config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCubitProvider<TodoMyCubit, TodoState>(
      create: (context) => TodoMyCubit(
              todoRepository:
                  TodoRepositoryImpl(todoDataSource: TodoDataSourceImpl()))
          ,
      child: MaterialApp(
        title: 'Todo App',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: RouteConstant.home,
      ),
    );
  }
}
