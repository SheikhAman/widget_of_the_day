import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// #122 — Widget of the Day: TextInputFormatter
///
/// A beginner-friendly example: format a phone number as the user types.
/// Typing "5551234567" turns into "(555) 123-4567" live.

class Day122TextInputFormatter extends StatelessWidget {
  const Day122TextInputFormatter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 122 - TextInputFormatter')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // only allow numbers
            LengthLimitingTextInputFormatter(10), // max 10 digits
            PhoneNumberFormatter(), // our custom formatter
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone number',
            hintText: '(555) 123-4567',
          ),
        ),
      ),
    );
  }
}

/// Turns raw digits like "5551234567" into "(555) 123-4567".
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text;
    String formatted = digits;

    if (digits.length > 6) {
      formatted =
          '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length > 3) {
      formatted = '(${digits.substring(0, 3)}) ${digits.substring(3)}';
    } else if (digits.isNotEmpty) {
      formatted = '(${digits}';
    }

    // Put the cursor at the end after formatting.
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
