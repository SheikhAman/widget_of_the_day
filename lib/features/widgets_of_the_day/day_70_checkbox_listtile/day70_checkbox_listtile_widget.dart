import 'package:flutter/material.dart';

class Day70CheckboxListTileWidget extends StatefulWidget {
  const Day70CheckboxListTileWidget({super.key});

  @override
  State<Day70CheckboxListTileWidget> createState() =>
      _Day70CheckboxListTileWidgetState();
}

class _Day70CheckboxListTileWidgetState
    extends State<Day70CheckboxListTileWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 70 - CheckboxListTile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: CheckboxListTile(
                title: const Text('Accept Terms & Conditions'),
                subtitle: const Text(
                  'You must accept before continuing',
                ),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
                checkColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              _isChecked ? 'Status: Accepted' : 'Status: Not Accepted',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}