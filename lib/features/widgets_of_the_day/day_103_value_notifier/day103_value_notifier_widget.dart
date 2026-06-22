import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_103_value_notifier/counter_state.dart';


class Day103ValueNotifier extends StatelessWidget {
  const Day103ValueNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Page Built");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 103 - ValueNotifier"),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: counterState.counter,
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Counter using\nValueNotifier",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "$value",
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: counterState.decrement,
            backgroundColor: Color(0xFF4F46E5),
            child: const Icon(Icons.remove),
          ),

          const SizedBox(width: 16),

          FloatingActionButton(
            heroTag: "increment",
            onPressed: counterState.increment,
            backgroundColor: Color(0xFF4F46E5),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}