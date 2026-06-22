import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'spin_model.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SpinModel.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        width: 100,
        height: 100,
        color: Color(0xFF4F46E5),
        child: const Center(
          child: Text(
            "Whee!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}