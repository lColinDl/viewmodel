import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewmodel/src/presenter.dart';
import 'package:viewmodel/src/stream_listener_widget.dart';
import 'package:viewmodel/src/ui_event.dart';
import 'package:viewmodel/src/viewmodel.dart';
import 'package:viewmodel/src/viewmodel_provider.dart';

abstract class ViewModelWidget<P extends Presenter<VM>, VM extends ViewModel> extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(debugLabel: 'Scaffold Key');

  ViewModelWidget({Key key}) : super(key: key);

  P buildPresenter(BuildContext context);
  Widget buildWidget(BuildContext context);
  void onUIEvent(BuildContext context, UIEvent event) {}

  final _ValueHolder<P> _presenter = _ValueHolder();
  P get presenter => _presenter.data;
  VM get viewModel => _presenter.data?.viewModel;

  @override
  Widget build(BuildContext context) {
    return PresenterAndViewModelProvider<P, VM>(
      presenter: buildPresenter,
      child: Consumer<P>(
        builder: (context, p, _) {
          _presenter.data = p;
          return Consumer<VM>(
            builder: (context, vm, _) {
              return StreamListenerWidget<UIEvent>(
                stream: Provider.of<VM>(context).uiEvents,
                onData: onUIEvent,
                child: buildWidget(context),
              );
            },
          );
        },
      ),
    );
  }
}

class _ValueHolder<T> {
  T data;
}
