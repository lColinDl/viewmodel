import 'package:viewmodel/src/view_model.dart';

abstract class Presenter<VM extends ViewModel> {
  VM get viewModel;

  void dispose() {
    viewModel.dispose();
  }
}
