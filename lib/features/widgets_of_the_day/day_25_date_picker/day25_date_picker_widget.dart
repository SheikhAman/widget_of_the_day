import 'package:flutter/material.dart';

class Day25DatePickerWidget extends StatefulWidget {
  const Day25DatePickerWidget({super.key});

  @override
  State<Day25DatePickerWidget> createState() =>
      _Day25DatePickerWidgetState();
}

class _Day25DatePickerWidgetState extends State<Day25DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String get formattedDate {
    return "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Day 25 - Date Picker"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month,
                size: 80,
                color: Colors.indigo,
              ),

              const SizedBox(height: 20),

              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: _showDatePicker,
                icon: const Icon(Icons.date_range),
                label: const Text("Choose Date"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}