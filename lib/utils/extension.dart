import 'package:custom_statemanagement_todo/utils/colors.dart';
import 'package:flutter/material.dart';

import '../state_management/inherited_cubit.dart';
import '../state_management/my_cubit.dart';

extension BuildContextExt on BuildContext {
  TMyCubit of<TMyCubit extends MyCubit<T>, T>() {
    return dependOnInheritedWidgetOfExactType<InheritedMyCubit<TMyCubit, T>>()!
        .notifier!;
  }
}

extension ScaffoldMessengerExt on BuildContext {
  showToast(String message) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      backgroundColor: ColorPicker.whiteColor,
      content: Text(
        message,
        style: TextStyle(color: ColorPicker.backgroundColor),
      )));
}
