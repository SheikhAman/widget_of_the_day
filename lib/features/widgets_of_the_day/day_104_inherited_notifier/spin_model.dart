import 'package:flutter/material.dart';

class SpinModel extends InheritedNotifier<AnimationController> {
  const SpinModel({
    super.key,
    required AnimationController controller,
    required super.child,
  }) : super(
    notifier: controller,
  );

  static AnimationController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SpinModel>()!
        .notifier!;
  }
}