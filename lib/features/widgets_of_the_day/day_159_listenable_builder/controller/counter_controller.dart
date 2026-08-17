import 'package:flutter/material.dart';

/// A professional 'Controller' class that separates business logic from the UI.
/// By implementing 'ChangeNotifier', it becomes a 'Listenable' that can be
/// used with 'ListenableBuilder'.
class CounterController extends ChangeNotifier {
  int _count = 0;

  /// Public getter for the current count.
  int get count => _count;

  /// Increments the counter and notifies listeners to trigger a rebuild.
  void increment() {
    _count++;
    notifyListeners();
  }

  /// Decrements the counter (min 0) and notifies listeners.
  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  /// Resets the counter to zero and notifies listeners.
  void reset() {
    _count = 0;
    notifyListeners();
  }
}
