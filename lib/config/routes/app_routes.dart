import 'package:custom_statemanagement_todo/config/routes/route_constant.dart';
import 'package:custom_statemanagement_todo/presentation/screens/todo_home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(builder: (context) => const TodoHomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
