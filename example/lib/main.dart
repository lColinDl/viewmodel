import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewmodel/viewmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ViewModelWidget<HomePresenter, HomeViewModel> {
  @override
  HomePresenter buildPresenter(BuildContext context) => HomePresenter();

  @override
  Widget buildWidget(BuildContext context) {
    final presenter = Provider.of<HomePresenter>(context);
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      body: Center(
        child: Text(
          viewModel.counter,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: presenter.increment,
      ),
    );
  }
}

class HomePresenter extends Presenter<HomeViewModel> {
  @override
  final HomeViewModel viewModel = HomeViewModel();

  int counter = 0;

  HomePresenter() {
    _setCounter();
  }

  void increment() {
    counter++;
    _setCounter();
  }

  void _setCounter() {
    viewModel.counter = 'Counter $counter';
  }
}

class HomeViewModel extends ViewModel {
  String _counter = '';
  String get counter => _counter;
  set counter(String value) {
    if (_counter == value) return;
    _counter = value;
    notifyListeners();
  }
}
