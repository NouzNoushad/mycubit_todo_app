import 'package:flutter/material.dart';

import 'inherited_cubit.dart';
import 'my_cubit.dart';

extension BuildContextExt on BuildContext {
  TMyCubit of<TMyCubit extends MyCubit<T>, T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedMyCubit<TMyCubit, T>>()!
        .notifier!;
  }
}
