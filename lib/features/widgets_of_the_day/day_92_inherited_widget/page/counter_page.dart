import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_92_inherited_widget/state_inherited_widget.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = StateInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Counter Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${state.counter}",
              style: const TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: state.increment,
              child: const Text("Increment"),
            ),

            ElevatedButton(
              onPressed: state.reset,
              child: const Text("Reset"),
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}