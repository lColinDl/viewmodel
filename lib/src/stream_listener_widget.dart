import 'dart:async';

import 'package:flutter/widgets.dart';

class StreamListenerWidget<T> extends StatefulWidget {
  final Widget? child;
  final Stream<T> stream;
  final void Function(BuildContext, T) onData;
  final Function? onError;
  final void Function()? onDone;

  StreamListenerWidget({
    super.key,
    this.child,
    required this.stream,
    required this.onData,
    this.onError,
    this.onDone,
  });

  void _onData(BuildContext context, T data) {
    onData(context, data);
  }

  @override
  _StreamListenerWidgetState createState() => _StreamListenerWidgetState<T>();
}

class _StreamListenerWidgetState<T> extends State<StreamListenerWidget> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _setUpSubscription();
  }

  void _setUpSubscription() {
    _subscription = widget.stream.listen(
      (data) => widget._onData(context, data),
      onError: widget.onError,
      onDone: widget.onDone,
    );
  }

  @override
  void didUpdateWidget(StreamListenerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stream != oldWidget.stream) {
      _subscription?.cancel();
      _setUpSubscription();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? Container();
  }
}
