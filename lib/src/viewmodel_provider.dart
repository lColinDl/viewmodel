import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:viewmodel/src/presenter.dart';
import 'package:viewmodel/src/viewmodel.dart';

class PresenterAndViewModelProvider<P extends Presenter<VM>, VM extends ViewModel> extends StatelessWidget {
  final Create<P> presenter;
  final Widget child;

  PresenterAndViewModelProvider({
    Key key,
    this.presenter,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<P>(
      create: presenter,
      dispose: (_, P presenter) => presenter.dispose(),
      child: Consumer<P>(
        builder: (BuildContext context, P presenter, Widget child) => ChangeNotifierProvider<VM>.value(
          value: presenter.viewModel,
          child: this.child,
        ),
      ),
    );
  }
}
