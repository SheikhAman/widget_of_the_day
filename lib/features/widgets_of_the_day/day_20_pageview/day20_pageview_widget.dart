import 'package:flutter/material.dart';
import 'posts/post1.dart';
import 'posts/post2.dart';
import 'posts/post3.dart';


class Day20PageViewWidget extends StatelessWidget {
  const Day20PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          Post1(),
          Post2(),
          Post3(),
        ],
      ),
    );
  }
}