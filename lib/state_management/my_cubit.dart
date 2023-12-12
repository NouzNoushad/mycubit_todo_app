import 'package:flutter/foundation.dart';

class MyCubit<T> extends ChangeNotifier implements ValueListenable<T> {
  MyCubit(this._state);
  T _state;

  @override
  T get value => _state;

  void emit(T newState) {
    if (_state == newState) {
      return;
    }
    _state = newState;
    notifyListeners();
  }
}
