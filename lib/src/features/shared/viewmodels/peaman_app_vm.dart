import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanAppVM extends ChangeNotifier {
  PeamanAppVM(final BuildContext context);

  PeamanAppState _appState = PeamanAppState();
  List<PeamanMessage> _tempMessages = [];

  List<PeamanMessage> get tempMessages => _tempMessages;
  PeamanAppState get appState => _appState;

  // update value of tempMessages
  void updateTempMessages(final List<PeamanMessage> newVal) {
    _tempMessages = newVal;
    notifyListeners();
  }

  // update value of appState
  void updateAppState(final PeamanAppState newVal) {
    _appState = newVal;
    notifyListeners();
  }
}
