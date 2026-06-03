import 'package:flutter/material.dart';

class Day10AppBarWidget extends StatelessWidget {
  const Day10AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {
            // open menu drawer
          },
          icon: const Icon(Icons.menu),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        title: const Text(
          "Flutter UI",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),

      body: const Center(
        child: Text(
          "AppBar Demo",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}