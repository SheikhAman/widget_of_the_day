import 'package:flutter/material.dart';

class Day116Opacity extends StatefulWidget {
  const Day116Opacity({super.key});

  @override
  State<Day116Opacity> createState() => _Day116OpacityState();
}

class _Day116OpacityState extends State<Day116Opacity> {
  bool _isFaded = false;
  bool _useAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 116 - Opacity')),
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
                'Opacity makes a widget transparent by a given value (0.0 to 1.0), '
                'but changes apply instantly. AnimatedOpacity does the same job, '
                'while smoothly animating the change over time — making it the '
                'better choice whenever transparency needs to transition, not snap.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── Mode Switch: Opacity vs AnimatedOpacity ─────────────
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _modeButton("Opacity", !_useAnimated),
                  _modeButton("AnimatedOpacity", _useAnimated),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Text(
              '${_useAnimated ? "AnimatedOpacity" : "Opacity"} — '
              '${_isFaded ? "0.3 🔅" : "1.0 🔆"}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                child: _useAnimated
                    ? AnimatedOpacity(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                        opacity: _isFaded ? 0.3 : 1.0,
                        child: _card(),
                      )
                    : Opacity(opacity: _isFaded ? 0.3 : 1.0, child: _card()),
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
              _useAnimated
                  ? "Watch closely — the fade transitions smoothly."
                  : "Watch closely — the change happens instantly, no animation.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isFaded
                    ? Colors.orange.shade700
                    : Colors.green.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              _useAnimated
                  ? "AnimatedOpacity animates opacity changes automatically —\nno AnimationController needed."
                  : "Opacity() always rebuilds and repaints instantly.\nSwitch modes above to compare the difference.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isFaded = !_isFaded;
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
                  _isFaded ? "Restore Opacity" : "Fade Widget",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _modeButton(String label, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _useAnimated = label == "AnimatedOpacity";
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF4F46E5) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: 220,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.visibility, color: Colors.white, size: 28),
          SizedBox(height: 8),
          Text(
            "Child Widget",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _legend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
