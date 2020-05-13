import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewmodel/src/viewmodel.dart';

Future<T> showViewModelDialog<T, VM extends ViewModel>({
  @required BuildContext context,
  @required VM viewModel,
  bool barrierDismissible,
  Widget Function(BuildContext context, VM viewModel) builder,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return ListenableProvider<VM>.value(
        value: viewModel,
        child: Consumer<VM>(
          builder: (context, viewModel, _) => builder(context, viewModel),
        ),
      );
    },
  );
}

Future<T> showViewModelModalBottomSheet<T, VM extends ViewModel>({
  @required BuildContext context,
  @required VM viewModel,
  Widget Function(BuildContext context, VM viewModel) builder,
}) {
  return showModalBottomSheet<T>(
    context: context,
    builder: (context) {
      return ListenableProvider<VM>.value(
        value: viewModel,
        child: Consumer<VM>(
          builder: (context, viewModel, _) => builder(context, viewModel),
        ),
      );
    },
  );
}
