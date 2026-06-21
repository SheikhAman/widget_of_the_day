import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day96StatefulBuilder extends StatefulWidget {
  const Day96StatefulBuilder({super.key});

  @override
  State<Day96StatefulBuilder> createState() => _Day96StatefulBuilderState();
}

class _Day96StatefulBuilderState extends State<Day96StatefulBuilder> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Full page rebuilt");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 96 - StatefulBuilder"),
        centerTitle: true,
      ),
      body: Center(
        child: StatefulBuilder(
          builder: (context, setInnerState) {
            debugPrint("StatefulBuilder rebuilt only");

            return CupertinoButton(
              onPressed: () {
                setInnerState(() {
                  counter++;
                });
              },
              child: Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}