import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_45_stateful/pages/first_page.dart';


class Day45StatefulWidget extends StatefulWidget {
  final int number;

  const Day45StatefulWidget({
    super.key,
    required this.number,
  });

  @override
  State<Day45StatefulWidget> createState() {
    debugPrint("createState called");
    return _Day45StatefulWidgetState();
  }
}

class _Day45StatefulWidgetState extends State<Day45StatefulWidget> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.number;
    debugPrint('initState → $number');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies → $number');
  }

  @override
  void didUpdateWidget(covariant Day45StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.number != widget.number) {
      debugPrint('didUpdateWidget → number changed');
    }
  }

  @override
  void deactivate() {
    debugPrint('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build → $number');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 45 - StatefulWidget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number.toString(),
              style: const TextStyle(fontSize: 70),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: const Text('Increment'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FirstPage(numberFirst: number),
                  ),
                );
              },
              child: const Text('Go to First Page'),
            ),
          ],
        ),
      ),
    );
  }
}