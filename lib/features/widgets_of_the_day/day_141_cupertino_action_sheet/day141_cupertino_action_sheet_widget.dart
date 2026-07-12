import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Day141CupertinoActionSheet extends StatelessWidget {
  const Day141CupertinoActionSheet({super.key});

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text("Sunset.jpg"),
        message: const Text("Choose what to do with this photo."),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Share"),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Save to Files"),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true, // colors this action red
            child: const Text("Delete Photo"),
          ),
        ],
        // The Cancel button is ALWAYS separated from the other actions
        // with a gap — this is Apple's Human Interface Guidelines
        // pattern, so users never accidentally tap it.
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          isDefaultAction: true, // makes the text bold
          child: const Text("Cancel"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 141 - CupertinoActionSheet')),
      body: Padding(
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
                '📱 CupertinoActionSheet slides up from the bottom with a '
                'list of actions — the standard iOS pattern for things '
                'like Share, Save, and Delete, seen in Photos, Safari, '
                'and Mail.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── Photo card ─────────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFBBF24), Color(0xFFF97316)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 200,
              alignment: Alignment.center,
              child: const Icon(
                Icons.wb_sunny_outlined,
                color: Colors.white,
                size: 56,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Sunset.jpg",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),

            const SizedBox(height: 24),

            // ── The trigger ────────────────────────────────────────
            ElevatedButton.icon(
              onPressed: () => _showActionSheet(context),
              icon: const Icon(Icons.more_horiz),
              label: const Text("Show Options"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
