import 'package:flutter/material.dart';

class Day01ContainerWidget extends StatelessWidget {
  const Day01ContainerWidget({super.key});

  static final Color _backgroundColor = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Day 01 - Container'),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Center(
      child: _buildNeumorphicContainer(),
    );
  }

  Widget _buildNeumorphicContainer() {
    return Container(
      height: 250,
      width: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(6, 6),
            blurRadius: 15,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 15,
          ),
        ],
      ),
    );
  }
}