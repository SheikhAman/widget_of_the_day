import 'package:flutter/material.dart';

class Day133ExcludeAndMergeSemantics extends StatefulWidget {
  const Day133ExcludeAndMergeSemantics({super.key});

  @override
  State<Day133ExcludeAndMergeSemantics> createState() =>
      _Day133ExcludeAndMergeSemanticsState();
}

class _Day133ExcludeAndMergeSemanticsState
    extends State<Day133ExcludeAndMergeSemantics> {
  bool _useExclude = false;
  bool _useMerge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 133 - Exclude & MergeSemantics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4F46E5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'These two widgets change how a screen reader groups things:\n'
                '• ExcludeSemantics = hide something from the screen reader\n'
                '• MergeSemantics = combine several items into one',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ── Section 1: ExcludeSemantics ─────────────────────────
            const Text(
              "1. ExcludeSemantics",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text(
              "Hides a decorative icon that has no real meaning.",
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Just a decorative star — it doesn't need to be
                  // read out loud on its own.
                  _useExclude
                      ? const ExcludeSemantics(
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 30,
                          ),
                        )
                      : const Icon(Icons.star, color: Colors.amber, size: 30),
                  const SizedBox(width: 12),
                  const Text("4.8 rating", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Text(
              _useExclude
                  ? "Screen reader says: \"4.8 rating\" only."
                  : "Screen reader says: \"star\", then \"4.8 rating\".",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: _useExclude
                    ? Colors.green.shade700
                    : Colors.red.shade600,
              ),
            ),

            const SizedBox(height: 14),

            ElevatedButton(
              onPressed: () => setState(() => _useExclude = !_useExclude),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
              ),
              child: Text(
                _useExclude
                    ? "Remove ExcludeSemantics"
                    : "Add ExcludeSemantics",
              ),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 20),

            // ── Section 2: MergeSemantics ────────────────────────────
            const Text(
              "2. MergeSemantics",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text(
              "Combines an icon + text + arrow into ONE announcement.",
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _useMerge
                  ? const MergeSemantics(child: _SettingsRow())
                  : const _SettingsRow(),
            ),

            const SizedBox(height: 8),

            Text(
              _useMerge
                  ? "Screen reader says: \"Notifications\" — just once."
                  : "Screen reader says: \"bell icon\", then \"Notifications\", "
                        "then \"arrow icon\" — 3 separate stops.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: _useMerge ? Colors.green.shade700 : Colors.red.shade600,
              ),
            ),

            const SizedBox(height: 14),

            ElevatedButton(
              onPressed: () => setState(() => _useMerge = !_useMerge),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
              ),
              child: Text(
                _useMerge ? "Remove MergeSemantics" : "Add MergeSemantics",
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// A simple settings row: icon + label + arrow.
// Without MergeSemantics, a screen reader treats these as 3 separate items.
class _SettingsRow extends StatelessWidget {
  const _SettingsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.notifications_outlined, color: Color(0xFF4F46E5)),
        SizedBox(width: 12),
        Expanded(child: Text("Notifications", style: TextStyle(fontSize: 16))),
        Icon(Icons.chevron_right, color: Colors.black38),
      ],
    );
  }
}
