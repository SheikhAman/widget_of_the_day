import 'package:flutter/material.dart';

class Day112OverflowBox extends StatefulWidget {
  const Day112OverflowBox({super.key});

  @override
  State<Day112OverflowBox> createState() => _State();
}

class _State extends State<Day112OverflowBox> {
  bool _useOverflow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Day 112 · OverflowBox'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ── Explanation card ───────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'A parent box limits how big its child can be.\n'
                    'OverflowBox says: "Let my child be bigger than me."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 48),

            // ── The demo ───────────────────────────────────────
            // This blue box is the PARENT. It is always 120×120.
            // The red circle wants to be 180×180.
            // Toggle to see what happens with / without OverflowBox.
            Column(
              children: [
                Text(
                  _useOverflow
                      ? 'With OverflowBox ✅'
                      : 'Without OverflowBox ❌',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Parent box — fixed 120×120, always visible
                Container(
                  width: 120,
                  height: 120,
                  color: const Color(0xFFBBDEFB), // light blue = parent
                  child: _useOverflow
                      ? OverflowBox(
                    // Now the child is allowed to be up to 180×180
                    maxWidth: 180,
                    maxHeight: 180,
                    child: _bigRedCircle(),
                  )
                      : _bigRedCircle(), // child gets clipped to 120×120
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _legendDot(const Color(0xFFBBDEFB)),
                    const SizedBox(width: 6),
                    const Text('Parent (120×120)  '),
                    _legendDot(Colors.red.shade300),
                    const SizedBox(width: 6),
                    const Text('Child (180×180)'),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  _useOverflow
                      ? 'Child overflows the parent — both sizes kept.'
                      : 'Child is clipped to fit inside the parent.',
                  style: TextStyle(
                    fontSize: 13,
                    color: _useOverflow
                        ? Colors.green.shade700
                        : Colors.red.shade600,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ── Toggle button ──────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() => _useOverflow = !_useOverflow),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _useOverflow ? 'Remove OverflowBox' : 'Add OverflowBox',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // The child that WANTS to be 180×180
  Widget _bigRedCircle() {
    return Center(
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.35),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red, width: 2),
        ),
        alignment: Alignment.center,
        child: const Text(
          '180×180',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _legendDot(Color color) => Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}
