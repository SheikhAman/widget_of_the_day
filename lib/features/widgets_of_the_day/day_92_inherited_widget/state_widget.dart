import 'package:flutter/material.dart';
import 'state_inherited_widget.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    super.key,
    required this.child,
  });

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      counter: counter,
      increment: incrementCounter,
      reset: resetCounter,
      child: widget.child,
    );
  }
}