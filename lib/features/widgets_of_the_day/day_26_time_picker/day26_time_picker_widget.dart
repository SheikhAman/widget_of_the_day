import 'package:flutter/material.dart';

class Day26TimePickerWidget extends StatefulWidget {
  const Day26TimePickerWidget({super.key});

  @override
  State<Day26TimePickerWidget> createState() =>
      _Day26TimePickerWidgetState();
}

class _Day26TimePickerWidgetState extends State<Day26TimePickerWidget> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 30);

  Future<void> _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 26 - Time Picker"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.access_time,
              size: 80,
              color: Colors.indigo,
            ),

            const SizedBox(height: 20),

            Text(
              selectedTime.format(context),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: _showTimePicker,
              icon: const Icon(Icons.schedule),
              label: const Text("Pick Time"),
            ),
          ],
        ),
      ),
    );
  }
}