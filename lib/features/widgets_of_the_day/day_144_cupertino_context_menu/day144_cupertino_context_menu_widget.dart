import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Day144CupertinoContextMenu extends StatelessWidget {
  const Day144CupertinoContextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 144 - CupertinoContextMenu')),
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
                '🔍 Long-press the photo below. It "pops" into a zoomed '
                'preview with a blurred background, and a menu of '
                'actions appears underneath — the classic iOS '
                'peek-and-pop interaction.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ── The long-pressable content ──────────────────────────
            Center(
              child: CupertinoContextMenu(
                // This is what shows normally, AND what gets zoomed
                // into the "peek" preview when long-pressed.
                actions: [
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.share,
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Share"),
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.doc_on_doc,
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Duplicate"),
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.delete,
                    isDestructiveAction: true, // colors it red
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Delete"),
                  ),
                ],
                // This is what shows normally, AND what gets zoomed
                // into the "peek" preview when long-pressed.
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFBBF24), Color(0xFFF97316)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.white,
                    size: 56,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Tap and hold (don't just tap) on a real device or "
              "simulator — a quick tap does nothing special.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
