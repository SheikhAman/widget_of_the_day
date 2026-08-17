import 'package:flutter/material.dart';
import 'controller/counter_controller.dart';
import 'widgets/counter_action_button.dart';

/// Day 159: ListenableBuilder (Modern State Management)
/// Real-world Example: Counter with Localized Rebuilds
///
/// PROBLEM: 'setState' rebuilds the entire widget tree, which is inefficient.
/// SOLUTION: 'ListenableBuilder' only rebuilds the specific widget listening
/// to the controller, improving performance and following the MVVM pattern.
class Day159ListenableBuilderWidget extends StatefulWidget {
  const Day159ListenableBuilderWidget({super.key});

  @override
  State<Day159ListenableBuilderWidget> createState() =>
      _Day159ListenableBuilderWidgetState();
}

class _Day159ListenableBuilderWidgetState
    extends State<Day159ListenableBuilderWidget> {
  // Initialize the logic controller (ViewModel)
  final CounterController _counterController = CounterController();

  @override
  void dispose() {
    // Clean up resource to prevent memory leaks
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Day 159 - ListenableBuilder')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.speed_rounded, size: 64, color: Colors.indigo),
              const SizedBox(height: 24),
              const Text(
                'High Performance UI',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Only the white card below rebuilds. The surrounding text and icons remain static.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(height: 40),

              // THE MAGIC: Only the builder content rebuilds when count changes.
              ListenableBuilder(
                listenable: _counterController,
                builder: (context, _) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.indigo.withValues(alpha: 0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        '${_counterController.count}',
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterActionButton(
                    icon: Icons.remove,
                    onPressed: _counterController.decrement,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 24),
                  CounterActionButton(
                    icon: Icons.add,
                    onPressed: _counterController.increment,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: _counterController.reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Counter'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
