import 'package:flutter/material.dart';

class Day113UnconstrainedBox extends StatefulWidget {
  const Day113UnconstrainedBox({super.key});

  @override
  State<Day113UnconstrainedBox> createState() =>
      _Day113UnconstrainedBoxState();
}

class _Day113UnconstrainedBoxState extends State<Day113UnconstrainedBox> {
  bool _useUnconstrainedBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Day 113 - UnconstrainedBox'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4F46E5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'Normally, a parent controls the size of its child.\n'
                    'UnconstrainedBox removes those constraints so the child '
                    'can use its natural size.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Text(
              _useUnconstrainedBox
                  ? 'With UnconstrainedBox ✅'
                  : 'Without UnconstrainedBox ❌',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 20),

            // Parent
            Container(
              width: 260,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _useUnconstrainedBox
                  ? UnconstrainedBox(
                child: _button(),
              )
                  : SizedBox(
                width: double.infinity,
                child: _button(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legend(Colors.blue.shade100, 'Parent'),
                const SizedBox(width: 18),
                _legend(const Color(0xFF4F46E5), 'Child'),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              _useUnconstrainedBox
                  ? 'The button keeps its natural width.'
                  : 'The button stretches to fill the parent.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _useUnconstrainedBox
                    ? Colors.green.shade700
                    : Colors.red.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _useUnconstrainedBox = !_useUnconstrainedBox;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _useUnconstrainedBox
                      ? 'Remove UnconstrainedBox'
                      : 'Add UnconstrainedBox',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.shopping_cart_checkout),
      label: const Text('Buy Now'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
      ),
    );
  }

  Widget _legend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}