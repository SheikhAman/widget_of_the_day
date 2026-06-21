import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_92_inheritade_widget/page/home_page.dart';
import 'state_widget.dart';

class Day92InheritedWidget extends StatelessWidget {
  const Day92InheritedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Day 92 - Inherited Widget",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4F46E5)),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF4F46E5), // Indigo
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        home: const HomePage(),
      ),
    );
  }
}