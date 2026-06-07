import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_31_navigator/screen/screen_0.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_31_navigator/screen/screen_1.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_31_navigator/screen/screen_2.dart';


class Day31NavigatorWidget extends StatelessWidget {
  const Day31NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const Screen0(),
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
      },
    );
  }
}