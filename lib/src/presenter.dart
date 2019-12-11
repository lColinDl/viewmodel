import 'package:viewmodel/src/viewmodel.dart';

abstract class Presenter<VM extends ViewModel> {
  VM get viewModel;

  void dispose() {
    viewModel.dispose();
  }
}
