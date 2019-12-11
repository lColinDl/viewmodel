import 'package:flutter/foundation.dart';

abstract class UIEvent {}

class SnackBarEvent implements UIEvent {
  final String message;
  SnackBarEvent(this.message);
}

class AlertDialogEvent implements UIEvent {
  final String title;
  final String content;
  final List<AlertAction> actions;
  AlertDialogEvent(this.title, this.content, [this.actions = const []]);
}

class AlertAction {
  final String text;
  final Future Function() action;
  AlertAction(this.text, this.action);

  static final Future Function() dispose = () => SynchronousFuture(null);
}
