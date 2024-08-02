import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:gemini_demo/core/enums/view_state.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    log('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    log('State:$viewState');
    _state = viewState;
  }

  void updateUI() {
    notifyListeners();
  }
}