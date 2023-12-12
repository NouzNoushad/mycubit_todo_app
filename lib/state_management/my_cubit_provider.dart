import 'package:custom_statemanagement_todo/state_management/inherited_cubit.dart';
import 'package:custom_statemanagement_todo/state_management/my_cubit.dart';
import 'package:flutter/material.dart';

class MyCubitProvider<TMyCubit extends MyCubit<T>, T> extends StatefulWidget {
  const MyCubitProvider({super.key, required this.child, required this.create});
  final Widget child;
  final TMyCubit Function(BuildContext context) create;

  @override
  State<StatefulWidget> createState() => _MyCubitProviderState<TMyCubit, T>();
}

class _MyCubitProviderState<TMyCubit extends MyCubit<T>, T>
    extends State<MyCubitProvider<TMyCubit, T>> {
  @override
  Widget build(BuildContext context) {
    return InheritedMyCubit<TMyCubit, T>(
        myCubitNotifier: widget.create(context), child: widget.child);
  }
}
