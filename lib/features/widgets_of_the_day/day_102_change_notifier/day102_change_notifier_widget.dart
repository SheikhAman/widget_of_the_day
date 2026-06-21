import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_102_change_notifier/counter_controller.dart' show CounterController;


class Day102ChangeNotifier extends StatefulWidget {
  const Day102ChangeNotifier({super.key});

  @override
  State<Day102ChangeNotifier> createState() => _Day102ChangeNotifierState();
}

class _Day102ChangeNotifierState extends State<Day102ChangeNotifier> {
  final CounterController controller = CounterController();

  @override
  void initState() {
    super.initState();

    // Rebuild UI whenever controller notifies listeners
    controller.addListener(() {
      setState(() {});
    });
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
        title: const Text("Day 102 - ChangeNotifier"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter using ChangeNotifier",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${controller.counter}",
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: controller.decrement,
            backgroundColor: Color(0xFF4F46E5),
            child: const Icon(Icons.remove),
          ),

          const SizedBox(width: 16),

          FloatingActionButton(
            heroTag: "increment",
            onPressed: controller.increment,
            backgroundColor: Color(0xFF4F46E5),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}