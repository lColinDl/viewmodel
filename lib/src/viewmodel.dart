import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:viewmodel/src/ui_event.dart';

abstract class ViewModel with ChangeNotifier {
  bool _isDisposed = false;
  final _uiEvents = StreamController<UIEvent>.broadcast();
  Stream<UIEvent> get uiEvents => _uiEvents.stream;

  void postEvent(UIEvent event) {
    if (_isDisposed) return;
    _uiEvents.add(event);
  }

  void update() {
    notifyListeners();
  }

  @override
  @mustCallSuper
  void notifyListeners() {
    if (_isDisposed) return;
    try {
      super.notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  @mustCallSuper
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _uiEvents.close();
    super.dispose();
  }
}
