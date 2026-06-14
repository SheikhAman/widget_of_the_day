import 'package:flutter/material.dart';

class Day63RangeSliderWidget extends StatefulWidget {
  const Day63RangeSliderWidget({super.key});

  @override
  State<Day63RangeSliderWidget> createState() => _Day63RangeSliderWidgetState();
}

class _Day63RangeSliderWidgetState extends State<Day63RangeSliderWidget> {
  RangeValues rangeValues = const RangeValues(0.1, 0.5);
  @override
  Widget build(BuildContext context) {
    RangeLabels rangeLabels = RangeLabels(
      rangeValues.start.toString(),
      rangeValues.end.toString(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 63 - RangeSlider'),
      ),
      body: Center(
        child: RangeSlider(
          values: rangeValues,
          divisions: 8,
          labels: rangeLabels,
          onChanged: (newValues) {
            setState(() {
              rangeValues = newValues;
            });
          },
        ),
      ),
    );
  }
}
