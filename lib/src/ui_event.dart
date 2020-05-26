import 'package:flutter/foundation.dart';

abstract class UIEvent {}

class SnackBarEvent implements UIEvent {
  final dynamic data;
  SnackBarEvent(this.data);
}

@deprecated
class AlertDialogEvent implements UIEvent {
  final String title;
  final String content;
  final List<AlertAction> actions;
  AlertDialogEvent(this.title, this.content, [this.actions = const []]);
}

@deprecated
class AlertAction {
  final String text;
  final Future Function() action;
  AlertAction(this.text, this.action);

  static final Future Function() dispose = () => SynchronousFuture(null);
}
