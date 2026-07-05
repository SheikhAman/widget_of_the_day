import 'package:flutter/material.dart';

/// Why does this matter?
///
/// `Container` is one of the most-used widgets in Flutter — but it's
/// NOT a single widget. It's a convenience wrapper that builds a whole
/// chain of widgets for you behind the scenes (padding, alignment,
/// constraints, decoration, margin, transform...).
///
/// `DecoratedBox` is just ONE of those pieces — the part that actually
/// paints a color/border/gradient/shadow. If all you need is decoration
/// (no padding, no margin, no alignment), `DecoratedBox` skips building
/// the extra layers Container adds for you, which matters when you're
/// rendering hundreds of items in a list.

class Day119DecoratedBox extends StatefulWidget {
  const Day119DecoratedBox({super.key});

  @override
  State<Day119DecoratedBox> createState() => _Day119DecoratedBoxState();
}

class _Day119DecoratedBoxState extends State<Day119DecoratedBox> {
  bool _useContainer = false;

  // Same visual decoration, used by both widgets below,
  // so the ONLY difference you see is which widget builds it.
  static final _decoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.deepPurple, Colors.pinkAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 119 - DecoratedBox')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Same look, two different widgets under the hood:',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // The actual box — visually identical either way.
            _useContainer
                ? Container(
                    width: 220,
                    height: 120,
                    decoration: _decoration,
                    alignment: Alignment.center,
                    child: const Text(
                      'Hello, Flutter!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SizedBox(
                    width: 220,
                    height: 120,
                    child: DecoratedBox(
                      decoration: _decoration,
                      child: const Center(
                        child: Text(
                          'Hello, Flutter!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

            const SizedBox(height: 24),

            Text(
              _useContainer
                  ? 'Built with: Container'
                  : 'Built with: DecoratedBox',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Shows what's actually happening behind the scenes.
            _buildWidgetTreeDiagram(),

            const Spacer(),

            ElevatedButton(
              onPressed: () => setState(() => _useContainer = !_useContainer),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: Text(
                _useContainer
                    ? 'Switch to DecoratedBox'
                    : 'Switch to Container',
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // A simple visual "under the hood" diagram — shows how many widgets
  // Container actually creates versus DecoratedBox alone.
  Widget _buildWidgetTreeDiagram() {
    final steps = _useContainer
        ? const [
            'Container',
            '└─ Padding        (if padding is set)',
            '   └─ Align        (if alignment is set)',
            '      └─ ConstrainedBox (if width/height is set)',
            '         └─ DecoratedBox   ← the part that actually paints',
          ]
        : const [
            'DecoratedBox   ← the part that actually paints',
            '(nothing else — no padding, align, or constraints layers)',
          ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: steps
            .map(
              (line) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  line,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
