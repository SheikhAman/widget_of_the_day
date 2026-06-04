import 'package:flutter/material.dart';

class Day14AnimatedContainerWidget extends StatefulWidget {
  const Day14AnimatedContainerWidget({super.key});

  @override
  State<Day14AnimatedContainerWidget> createState() =>
      _Day14AnimatedContainerWidgetState();
}

class _Day14AnimatedContainerWidgetState
    extends State<Day14AnimatedContainerWidget> {
  bool isExpanded = false;

  void _animateBox() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 14 - AnimatedContainer"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: GestureDetector(
          onTap: _animateBox,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,

            height: isExpanded ? 250 : 120,
            width: isExpanded ? 250 : 120,

            decoration: BoxDecoration(
              color: isExpanded
                  ? Colors.pink
                  : Colors.deepPurple,
              borderRadius: BorderRadius.circular(
                isExpanded ? 40 : 16,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),

            child: Center(
              child: Icon(
                isExpanded
                    ? Icons.favorite
                    : Icons.touch_app,
                color: Colors.white,
                size: isExpanded ? 70 : 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}