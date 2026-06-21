import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day95CupertinoSearchTextField extends StatefulWidget {
  const Day95CupertinoSearchTextField({super.key});

  @override
  State<Day95CupertinoSearchTextField> createState() => _Day95CupertinoSearchTextFieldState();
}

class _Day95CupertinoSearchTextFieldState extends State<Day95CupertinoSearchTextField> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 95 - CupertinoSearchTextField"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              placeholder: "Search here...",
              onChanged: (value) {
                setState(() {});
              },
            ),

            const SizedBox(height: 20),

            Text(
              "You typed: ${searchController.text}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}