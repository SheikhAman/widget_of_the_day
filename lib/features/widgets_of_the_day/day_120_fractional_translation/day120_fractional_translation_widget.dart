import 'package:flutter/material.dart';

class Day120FractionalTranslation extends StatefulWidget {
  const Day120FractionalTranslation({super.key});

  @override
  State<Day120FractionalTranslation> createState() =>
      _Day120FractionalTranslationState();
}

class _Day120FractionalTranslationState
    extends State<Day120FractionalTranslation> {
  bool _isTranslated = false;
  bool _useAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Day 120 - FractionalTranslation'),
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
                'FractionalTranslation shifts a widget by a fraction of its own '
                'width and height — e.g. (1.0, 0.0) moves it exactly one full '
                'width to the right. This makes slide-in/out effects work on '
                'any screen size, without hardcoding pixel values.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── Mode Switch: Instant vs Animated ────────────────────
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _modeButton("FractionalTranslation", !_useAnimated),
                  _modeButton("AnimatedSlide", _useAnimated),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Text(
              _isTranslated ? 'Offset: (0.6, 0.0) ➡️' : 'Offset: (0.0, 0.0) ⏸️',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 140,
              padding: const EdgeInsets.all(12),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: _useAnimated
                    ? AnimatedSlide(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        offset: Offset(_isTranslated ? 0.6 : 0.0, 0.0),
                        child: _card(),
                      )
                    : FractionalTranslation(
                        translation: Offset(_isTranslated ? 0.6 : 0.0, 0.0),
                        child: _card(),
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
              _useAnimated
                  ? "AnimatedSlide smoothly tweens the offset over time."
                  : "FractionalTranslation jumps to the offset instantly.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isTranslated
                    ? Colors.green.shade700
                    : Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Note: the child keeps its original layout space — only its\n"
              "paint position shifts, which is why it can overlap siblings.",
              textAlign: TextAlign.center,
              style: TextStyle(
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
                    _isTranslated = !_isTranslated;
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
                  _isTranslated ? "Slide Back" : "Slide Out",
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
            _useAnimated = label == "AnimatedSlide";
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
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
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
      width: 90,
      height: 90,
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
      child: const Icon(Icons.swipe, color: Colors.white, size: 32),
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
