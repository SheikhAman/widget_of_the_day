import 'package:flutter/material.dart';

class CounterState {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}

final counterState = CounterState();