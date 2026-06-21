import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_92_inherited_widget/state_inherited_widget.dart';
import 'counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = StateInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 92 - Inherited Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${state.counter}",
              style: const TextStyle(fontSize: 80),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: state.increment,
              child: const Text("Increment"),
            ),

            ElevatedButton(
              onPressed: state.reset,
              child: const Text("Reset"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CounterPage(),
                  ),
                );
              },
              child: const Text("Go to Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}