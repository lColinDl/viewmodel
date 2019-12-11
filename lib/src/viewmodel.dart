import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:viewmodel/src/ui_event.dart';

abstract class ViewModel with ChangeNotifier {
  final _uiEvents = StreamController<UIEvent>.broadcast();
  Stream<UIEvent> get uiEvents => _uiEvents.stream;

  void postEvent(UIEvent event) {
    _uiEvents.add(event);
  }

  void update() {
    notifyListeners();
  }

  @override
  @mustCallSuper
  void notifyListeners() {
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
    _uiEvents.close();
    super.dispose();
  }
}
