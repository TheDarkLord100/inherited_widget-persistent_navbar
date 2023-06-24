import 'package:flutter/material.dart';

class CountState extends InheritedWidget {
  const CountState(
      {Key? key,
      required Widget child,
      required this.count,
      required this.addCounter,
      required this.removeCounter})
      : super(key: key, child: child);

  final int count;
  final VoidCallback addCounter;
  final VoidCallback removeCounter;

  static CountState of(BuildContext context) {
    final CountState? result =
        context.dependOnInheritedWidgetOfExactType<CountState>();
    assert(result != null, 'No Screen found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CountState oldWidget) {
    return count != oldWidget.count;
  }
}
