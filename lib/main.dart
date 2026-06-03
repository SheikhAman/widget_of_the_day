import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_11_drawer/day11_drawer_widget.dart';
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
        primarySwatch: Colors.purple,
      ),
      // home: const Day01ContainerWidget(),
      // home: const Day02ExpandedWidget(),
      // home: const Day03ColumnWidget(),
      // home: const Day03RowWidget(),
      // home: Day04ListViewWidget(),
      // home: Day05ClipRRectWidget(),
      // home: Day06ImageAssetWidget(),
      // home: Day07GridViewWidget(),
      // home: Day09BottomNavBarWidget(),
      home: Day11DrawerWidget(),
    );
  }
}

