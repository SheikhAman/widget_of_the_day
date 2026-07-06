import 'package:flutter/material.dart';

class Day125DefaultTextStyle extends StatefulWidget {
  const Day125DefaultTextStyle({super.key});

  @override
  State<Day125DefaultTextStyle> createState() => _Day125DefaultTextStyleState();
}

class _Day125DefaultTextStyleState extends State<Day125DefaultTextStyle> {
  bool _applyStyle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 125 - DefaultTextStyle')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '🎨 DefaultTextStyle sets a style once, and every Text below '
                'it in the tree automatically inherits it — no need to '
                'repeat the same style on every single Text widget.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            Text(
              _applyStyle
                  ? 'With DefaultTextStyle ✅'
                  : 'Without It (Flutter defaults) ❌',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),

            const SizedBox(height: 20),

            // ── The demo box ─────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _applyStyle
                  ? DefaultTextStyle(
                      style: const TextStyle(
                        color: Color(0xFF6366F1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Plain Text 1"), // inherits the style
                          const SizedBox(height: 8),
                          const Text("Plain Text 2"), // inherits the style
                          const SizedBox(height: 8),
                          // This one overrides the inherited style directly.
                          Text(
                            "Text 3 (overridden)",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Plain Text 1"),
                        SizedBox(height: 8),
                        Text("Plain Text 2"),
                        SizedBox(height: 8),
                        Text("Text 3 (overridden)"),
                      ],
                    ),
            ),

            const SizedBox(height: 20),

            Text(
              _applyStyle
                  ? "Text 1 & 2 inherited the bold purple italic style. "
                        "Text 3 overrode it with its own style."
                  : "All 3 look identical — Flutter's plain default text style.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _applyStyle
                    ? Colors.green.shade700
                    : Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _applyStyle = !_applyStyle;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _applyStyle
                      ? "Remove DefaultTextStyle"
                      : "Apply DefaultTextStyle",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),

            _factCard(
              "This is the same inherited-style system Flutter uses "
              "internally — for example, Text widgets inside a Card or "
              "AppBar automatically pick up the right color and size "
              "without you setting it manually every time.",
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _factCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFC7D2FE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, color: Color(0xFF6366F1)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
