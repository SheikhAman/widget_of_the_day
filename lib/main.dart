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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
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
      // home: const Day01ContainerWidget(),
      // home: const Day02ExpandedWidget(),
      // home: const Day03ColumnWidget(),
      // home: const Day03RowWidget(),
      // home:  Day04ListViewWidget(),
      // home: const Day05ClipRRectWidget(),
      // home: const Day06ImageAssetWidget(),
      // home: const Day07GridViewWidget(),
      // home: const Day08GestureDetectorWidget(),
      // home: const Day09BottomNavBarWidget(),
      // home: const Day10AppBarWidget(),
      // home: const Day11DrawerWidget(),
      // home: const Day12SliverAppBarWidget(),
      // home: const Day13TabBarWidget(),
      // home: const Day14AnimatedContainerWidget(),
      // home: const Day15MediaQueryWidget(),
      // home: Day16AlertDialogWidget(),
      // home: Day17TextStyleWidget(),
      // home: Day18RichTextWidget(),
      // home: const Day19TimerWidget(),
      // home: const Day20PageViewWidget(),
      // home: const Day21StackWidget(),
      // home: const Day22TextFieldWidget(),
      // home: const Day23AnimatedIconWidget(),
      // home: const Day24SliderWidget(),
      // home: const Day25DatePickerWidget(),
      // home: const Day26TimePickerWidget(),
      // home: const Day27WheelTimePickerWidget(),
      // home: const Day28LinearGradientWidget(),
      // home: const Day29ElevatedButtonAndOutlinedButtonWidget(),
      // home: const Day30FloatingActionButtonWidget(),
      // home: const Day31NavigatorWidget(),
      // home: const Day32CardWidget(),
      // home: const Day33ClipperWidget(),
      // home: const Day34RawMaterialButtonWidget(),
      // home: const Day35RotatedBoxWidget(),
      // home: const Day36TransformWidget(),
      // home: const Day37PositionedWidget(),
      // home: const Day38IconButtonWidget(),
      // home: const Day39CustomPaintWidget(),
      // home: const Day40ClipOvalWidget(),
      // home: const Day41ClipRRectWidget(),
      // home: const Day42ClipRectWidget(),
      // home: const Day43ClipPathWidget(),
      // home: const Day44RadialAndSweepGradientWidget(),
      // home: const Day45StatefulWidget(number: 0),
      // home: const Day46TableWidget(),
      // home: const Day47DataTableWidget(),
      // home: const Day48PlaceholderWidget(),
      // home: const Day49GestureInkWellWidget(),
      home: const Day50MaterialWidget(),
    );
  }
}

