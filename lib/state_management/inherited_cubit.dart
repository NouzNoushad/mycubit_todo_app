import 'package:custom_statemanagement_todo/state_management/my_cubit.dart';
import 'package:flutter/material.dart';

class InheritedMyCubit<TMyCubit extends MyCubit<T>, T>
    extends InheritedNotifier<TMyCubit> {
  const InheritedMyCubit(
      {Key? key, required Widget child, required TMyCubit myCubitNotifier})
      : super(key: key, notifier: myCubitNotifier, child: child);

  static TMyCubit of<TMyCubit extends MyCubit<T>, T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedMyCubit<TMyCubit, T>>()!
        .notifier!;
  }
}
