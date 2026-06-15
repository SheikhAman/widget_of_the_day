import 'package:flutter/material.dart';

class Day71SelectableTextWidget extends StatefulWidget {
  const Day71SelectableTextWidget({super.key});

  @override
  State<Day71SelectableTextWidget> createState() =>
      _Day71SelectableTextWidgetState();
}

class _Day71SelectableTextWidgetState
    extends State<Day71SelectableTextWidget> {
  String selectedText = '';

  final String fullText = 'This is a selectable text example in Flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 71 - SelectableText'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedText.isEmpty
                  ? 'Select text below 👇'
                  : 'Selected: $selectedText',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextSelectionTheme(
              data: const TextSelectionThemeData(
                selectionColor: Colors.yellowAccent,
              ),
              child: SelectableText(
                fullText,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                onSelectionChanged: (selection, cause) {
                  final start = selection.start;
                  final end = selection.end;

                  if (start >= 0 && end >= 0 && start != end) {
                    setState(() {
                      selectedText = fullText.substring(start, end);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}