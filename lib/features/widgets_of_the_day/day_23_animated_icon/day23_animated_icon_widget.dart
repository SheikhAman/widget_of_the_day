import 'package:flutter/material.dart';

class Day23AnimatedIconWidget extends StatefulWidget {
  const Day23AnimatedIconWidget({super.key});

  @override
  State<Day23AnimatedIconWidget> createState() =>
      _Day23AnimatedIconWidgetState();
}

class _Day23AnimatedIconWidgetState extends State<Day23AnimatedIconWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _toggleIcon() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 23 - Animated Icon"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: GestureDetector(
          onTap: _toggleIcon,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            size: 120,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}