import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_39_custom_paint/bottom_nav_painter.dart';

class Day39CustomPaintWidget extends StatelessWidget {
  const Day39CustomPaintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text('Day 39 - Custom Paint'),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 90,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 90),
                    painter: BottomNavPainter(),
                  ),

                  // Floating Action Button
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.indigo,
                      child: const Icon(Icons.shopping_basket),
                    ),
                  ),

                  // Bottom Icons
                  SizedBox(
                    width: size.width,
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.home),
                          color: Colors.indigo,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.restaurant_menu),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        SizedBox(width: size.width * 0.20),
                        IconButton(
                          icon: const Icon(Icons.bookmark),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}