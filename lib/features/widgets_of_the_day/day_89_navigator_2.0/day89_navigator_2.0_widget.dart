import 'package:flutter/material.dart';
import 'views/first_screen.dart';
import 'views/second_screen.dart';

class Day89Navigator2Widget extends StatefulWidget {
  const Day89Navigator2Widget({super.key});

  @override
  State<Day89Navigator2Widget> createState() =>
      _Day89Navigator2WidgetState();
}

class _Day89Navigator2WidgetState extends State<Day89Navigator2Widget> {
  bool isFirstScreen = true;

  void setScreen(bool value) {
    setState(() {
      isFirstScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 89 - Navigator 2.0',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Navigator(
        pages: [
          MaterialPage(
            child: FirstScreen(onNavigate: setScreen),
          ),
          if (!isFirstScreen)
            MaterialPage(
              child: SecondScreen(onNavigate: setScreen),
            ),
        ],
        onDidRemovePage: (page) {
          setScreen(true);
        },
      ),
    );
  }
}