import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:viewmodel/src/presenter.dart';
import 'package:viewmodel/src/view_model.dart';

class PresenterAndViewModelProvider<P extends Presenter<VM>,
    VM extends ViewModel> extends StatelessWidget {
  final Create<P> presenter;
  final Widget child;

  PresenterAndViewModelProvider({
    super.key,
    required this.presenter,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<P>(
      create: presenter,
      dispose: (_, P presenter) => presenter.dispose(),
      child: Consumer<P>(
        builder: (context, P presenter, child) =>
            ChangeNotifierProvider<VM>.value(
          value: presenter.viewModel,
          child: Consumer<VM>(
            builder: (context, vm, child) => this.child,
          ),
        ),
      ),
    );
  }
}
