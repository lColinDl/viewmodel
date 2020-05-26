import 'package:flutter/material.dart';
import 'package:viewmodel/src/ui_event.dart';

@deprecated
class UIEventAlertDialog extends StatelessWidget {
  final AlertDialogEvent event;

  UIEventAlertDialog(this.event);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(event.title),
      content: Text(event.content),
      actions: <Widget>[
        for (final action in event.actions)
          FlatButton(
            child: Text(action.text),
            onPressed: () {
              if (action.action == AlertAction.dispose) {
                Navigator.of(context).pop();
              } else {
                action.action().then((result) => Navigator.pop(context, result));
              }
            },
          ),
      ],
    );
  }
}
