import 'package:flutter/material.dart';

class Day132Semantics extends StatefulWidget {
  const Day132Semantics({super.key});

  @override
  State<Day132Semantics> createState() => _Day132SemanticsState();
}

class _Day132SemanticsState extends State<Day132Semantics> {
  bool _isFavorited = false;
  bool _useSemantics = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 132 - Semantics')),
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
                '♿ A custom icon button built with GestureDetector has NO '
                'accessibility info by default. Semantics tells screen '
                'readers like TalkBack/VoiceOver what the widget is and '
                'does — required for enterprise & government apps.',
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
              _useSemantics ? 'With Semantics ✅' : 'Without Semantics ❌',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),

            const SizedBox(height: 20),

            // ── The demo box ─────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(24),
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
              child: Center(
                child: _useSemantics
                    ? Semantics(
                        // These are the exact pieces a screen reader reads
                        // out loud when the user focuses this widget.
                        label: "Favorite this item",
                        hint: "Double tap to toggle favorite",
                        button: true,
                        toggled: _isFavorited,
                        // Hide the raw icon's own (empty) semantics so the
                        // screen reader only reads our custom label above.
                        child: ExcludeSemantics(child: _favoriteButton()),
                      )
                    : _favoriteButton(),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFC7D2FE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "A screen reader would announce:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _useSemantics
                        ? '"Favorite this item, button, ${_isFavorited ? "on" : "off"}. '
                              'Double tap to toggle favorite."'
                        : '"Double tap." (no label, no role, no state — '
                              'completely unusable for a blind user)',
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: _useSemantics
                          ? Colors.green.shade700
                          : Colors.red.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _useSemantics = !_useSemantics;
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
                  _useSemantics ? "Remove Semantics" : "Add Semantics",
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

  Widget _favoriteButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      },
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: _isFavorited
              ? const Color(0xFFFFE4E6)
              : const Color(0xFFF3F4F6),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          _isFavorited ? Icons.favorite : Icons.favorite_border,
          color: _isFavorited ? Colors.redAccent : Colors.grey.shade500,
          size: 30,
        ),
      ),
    );
  }
}
