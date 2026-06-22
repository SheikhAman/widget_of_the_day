import 'package:flutter/material.dart';
import 'spin_model.dart';
import 'spinner.dart';

class Day104InheritedNotifier extends StatefulWidget {
  const Day104InheritedNotifier({super.key});

  @override
  State<Day104InheritedNotifier> createState() =>
      _Day104InheritedNotifierState();
}

class _Day104InheritedNotifierState extends State<Day104InheritedNotifier>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 104 - InheritedNotifier"),
        centerTitle: true,
      ),
      body: Center(
        child: SpinModel(
          controller: controller,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spinner(),
              Spinner(),
              Spinner(),
            ],
          ),
        ),
      ),
    );
  }
}