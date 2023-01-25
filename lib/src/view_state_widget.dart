import 'package:flutter/material.dart';
import 'package:viewmodel/src/view_state.dart';

class ViewStateWidget extends StatelessWidget {
  final ViewState viewState;
  final WidgetBuilder contentBuilder;
  final WidgetBuilder loadingBuilder;
  final WidgetBuilder errorBuilder;

  ViewStateWidget({
    required this.viewState,
    required this.contentBuilder,
    required this.loadingBuilder,
    required this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case ViewState.loading:
        return loadingBuilder.call(context);
      case ViewState.error:
        return errorBuilder.call(context);
      case ViewState.data:
        return contentBuilder(context);
      default:
        throw Exception('Unkown viewState $viewState');
    }
  }
}
