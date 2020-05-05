import 'package:flutter/material.dart';
import 'package:viewmodel/src/viewstate.dart';

class ViewStateWidget extends StatelessWidget {
  final ViewState viewState;

  final WidgetBuilder body;
  final WidgetBuilder loadingBuilder;
  final WidgetBuilder errorBuilder;
  final VoidCallback onReload;
  final String loadingMessage;
  final String errorMessage;

  ViewStateWidget({
    @required this.viewState,
    @required this.body,
    this.loadingBuilder,
    this.loadingMessage,
    this.errorBuilder,
    this.errorMessage,
    this.onReload,
  });

  WidgetBuilder get _defaultLoadingBuilder => (context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                if (loadingMessage != null) ...[
                  SizedBox(height: 8.0),
                  Text(
                    loadingMessage,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      };

  WidgetBuilder get _defaultErrorBuilder => (context) {
        final msg = errorMessage ?? 'An error occured';
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  msg,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),
                if (onReload != null) ...[
                  SizedBox(height: 8.0),
                  RaisedButton(
                    child: Text('Retry'),
                    onPressed: onReload,
                  ),
                ],
              ],
            ),
          ),
        );
      };

  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case ViewState.loading:
        return loadingBuilder?.call(context) ?? _defaultLoadingBuilder(context);
      case ViewState.error:
        return errorBuilder?.call(context) ?? _defaultErrorBuilder(context);
      case ViewState.data:
        return body(context);
      default:
        throw Exception('Unkown viewState $viewState');
    }
  }
}
