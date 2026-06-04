import 'package:flutter/material.dart';

class Day16AlertDialogWidget extends StatefulWidget {
  const Day16AlertDialogWidget({super.key});

  @override
  State<Day16AlertDialogWidget> createState() =>
      _Day16AlertDialogWidgetState();
}

class _Day16AlertDialogWidgetState extends State<Day16AlertDialogWidget> {

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          title: const Text(
            "Delete Item?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: const Text(
            "This action cannot be undone. Do you really want to continue?",
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Item deleted successfully"),
                  ),
                );
              },
              child: const Text("Delete",style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 16 - AlertDialog"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: _showDialog,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
          ),
          child: const Text(
            "Show Dialog",
            style: TextStyle(fontSize: 18,color: Colors.white),
          ),
        ),
      ),
    );
  }
}