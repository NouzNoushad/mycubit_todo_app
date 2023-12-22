import 'package:custom_statemanagement_todo/config/routes/route_constant.dart';
import 'package:custom_statemanagement_todo/features/presentation/screens/add_todo.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/screens/todo_home.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(builder: (context) => const TodoHomeScreen());
      case RouteConstant.add:
        return MaterialPageRoute(builder: (context) => const AddTodoScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
