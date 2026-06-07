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
      // home: Day08GestureDetectorWidget(),
      // home: Day09BottomNavBarWidget(),
      // home: Day10AppBarWidget(),
      // home: Day11DrawerWidget(),
      // home: Day12SliverAppBarWidget(),
      // home: Day13TabBarWidget(),
      // home: Day14AnimatedContainerWidget(),
      // home: Day15MediaQueryWidget(),
      // home: Day16AlertDialogWidget(),
      // home: Day17TextStyleWidget(),
      // home: Day18RichTextWidget(),
      // home: Day19TimerWidget(),
      // home: const Day20PageViewWidget(),
      // home: const Day21StackWidget(),
      // home: const Day22TextFieldWidget(),
      // home: const Day23AnimatedIconWidget(),
      // home: const Day24SliderWidget(),
      // home: const Day25DatePickerWidget(),
      // home: const Day26TimePickerWidget(),
      // home: const Day27WheelTimePicker(),
      // home: const Day28LinearGradientWidget(),
      // home: const Day29ElevatedButtonAndOutlinedButtonWidget(),
      // home: const Day30FloatingActionButtonWidget(),
      home: const Day31NavigatorWidget(),
    );
  }
}

