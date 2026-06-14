import 'package:flutter/material.dart';

class Day60ChoiceChipWidget extends StatefulWidget {
  const Day60ChoiceChipWidget({super.key});

  @override
  State<Day60ChoiceChipWidget> createState() => _Day60ChoiceChipWidgetState();
}

class _Day60ChoiceChipWidgetState extends State<Day60ChoiceChipWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 60 - ChoiceChip'),
      ),
      body: Center(
        child: ChoiceChip(
          avatar: const Icon(Icons.star, size: 18),
          label: const Text('Flutter Developer'),
          selected: isSelected,
          selectedColor: Colors.deepPurple,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
          onSelected: (value) {
            setState(() {
              isSelected = value;
            });
          },
        ),
      ),
    );
  }
}