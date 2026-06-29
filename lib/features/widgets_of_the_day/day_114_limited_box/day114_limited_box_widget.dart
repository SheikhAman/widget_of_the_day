import 'package:flutter/material.dart';

class Day114LimitedBox extends StatefulWidget {
  const Day114LimitedBox({super.key});

  @override
  State<Day114LimitedBox> createState() => _Day114LimitedBoxState();
}

class _Day114LimitedBoxState extends State<Day114LimitedBox> {
  bool _useLimitedBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Day 114 - LimitedBox'),
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
                'LimitedBox applies a maximum width or height only when '
                    'its parent provides unbounded constraints. It is commonly '
                    'used with widgets like UnconstrainedBox or ListView.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Text(
              _useLimitedBox
                  ? 'With LimitedBox ✅'
                  : 'Without LimitedBox ❌',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 280,
              height: 180,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: UnconstrainedBox(
                  child: _useLimitedBox
                      ? LimitedBox(
                    maxWidth: 160,
                    maxHeight: 80,
                    child: _childBox(),
                  )
                      : _childBox(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legend(Colors.blue.shade100, "Parent"),
                const SizedBox(width: 20),
                _legend(Colors.deepPurple, "Child"),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              _useLimitedBox
                  ? "Child is limited to 160 × 80."
                  : "Child uses its full 260 × 120 size.",
              style: TextStyle(
                color: _useLimitedBox
                    ? Colors.green.shade700
                    : Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _useLimitedBox = !_useLimitedBox;
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
                  _useLimitedBox
                      ? "Remove LimitedBox"
                      : "Add LimitedBox",
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

  Widget _childBox() {
    return Container(
      width: 260,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Text(
        "Child Widget",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
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