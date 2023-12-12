import 'package:custom_statemanagement_todo/state_management/inherited_cubit.dart';
import 'package:custom_statemanagement_todo/state_management/my_cubit.dart';
import 'package:flutter/material.dart';

class MyCubitBuilder<TMyCubit extends MyCubit<T>, T> extends StatefulWidget {
  const MyCubitBuilder({super.key, required this.builder});
  final Widget Function(BuildContext context, T state) builder;

  @override
  State<StatefulWidget> createState() => _MyCubitBuilderState<TMyCubit, T>();
}

class _MyCubitBuilderState<TMyCubit extends MyCubit<T>, T>
    extends State<MyCubitBuilder<TMyCubit, T>> {
  @override
  Widget build(BuildContext context) {
    var myCubitState = InheritedMyCubit.of<TMyCubit, T>(context);
    return ValueListenableBuilder(
        valueListenable: myCubitState,
        builder: (context, state, _) => widget.builder(context, state));
  }
}
