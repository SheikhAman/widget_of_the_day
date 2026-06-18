import 'package:flutter/material.dart';

class Day88IndexedStackWidget extends StatefulWidget {
  const Day88IndexedStackWidget({super.key});

  @override
  State<Day88IndexedStackWidget> createState() =>
      _Day88IndexedStackWidgetState();
}

class _Day88IndexedStackWidgetState extends State<Day88IndexedStackWidget> {
  int index = 0;

  void changeIndex() {
    setState(() {
      index = (index + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 88 - IndexedStack'),
        centerTitle: true,
      ),
      body: Center(
        child: IndexedStack(
          index: index,
          children: [
            _buildBox(Colors.red, 'Screen 1'),
            _buildBox(Colors.blue, 'Screen 2'),
            _buildBox(Colors.orange, 'Screen 3'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeIndex,
        backgroundColor: Color(0xFF4F46E5),
        child:  Icon(Icons.swap_horiz),
      ),
    );
  }

  Widget _buildBox(Color color, String text) {
    return Container(
      width: 200,
      height: 200,
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}