import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/widgets_of_the_day.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Of The Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.purple,
      ),
      home: const Day01ContainerWidget(),
    );
  }
}

