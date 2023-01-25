import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewmodel/src/presenter.dart';
import 'package:viewmodel/src/stream_listener_widget.dart';
import 'package:viewmodel/src/ui_event.dart';
import 'package:viewmodel/src/view_model.dart';
import 'package:viewmodel/src/view_model_provider.dart';

abstract class ViewModelWidget<P extends Presenter<VM>, VM extends ViewModel>
    extends StatelessWidget {
  ViewModelWidget({super.key});

  P buildPresenter(BuildContext context);

  Widget buildWidget(BuildContext context);

  void onUIEvent(BuildContext context, UIEvent event) {}

  final _ValueHolder<P> _presenterHolder = _ValueHolder();

  P get presenter => _presenterHolder.data;

  VM get viewModel => _presenterHolder.data.viewModel;

  @override
  Widget build(BuildContext context) {
    return PresenterAndViewModelProvider<P, VM>(
      presenter: buildPresenter,
      child: Consumer<P>(
        builder: (context, p, _) {
          _presenterHolder.data = p;

          return StreamListenerWidget<UIEvent>(
            stream: Provider.of<VM>(context).uiEvents,
            onData: onUIEvent,
            child: buildWidget(context),
          );
        },
      ),
    );
  }
}

class _ValueHolder<T> {
  late T data;
}
