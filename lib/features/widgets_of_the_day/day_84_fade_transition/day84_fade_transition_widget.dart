import 'package:flutter/material.dart';

class Day84FadeTransitionWidget extends StatefulWidget {
  const Day84FadeTransitionWidget({super.key});

  @override
  State<Day84FadeTransitionWidget> createState() =>
      _Day84FadeTransitionWidgetState();
}

class _Day84FadeTransitionWidgetState
    extends State<Day84FadeTransitionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 84 - FadeTransition'),
        centerTitle: true,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}