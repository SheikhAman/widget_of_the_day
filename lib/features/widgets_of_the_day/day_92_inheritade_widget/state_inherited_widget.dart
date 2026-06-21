import 'package:flutter/material.dart';

class StateInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback reset;

  const StateInheritedWidget({
    super.key,
    required this.counter,
    required this.increment,
    required this.reset,
    required super.child,
  });

  static StateInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}