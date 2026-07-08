import 'package:flutter/material.dart';

class Day136PopScope extends StatelessWidget {
  const Day136PopScope({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 136 - PopScope')),
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
                '🔙 PopScope intercepts the Android back button (and the '
                'iOS/Android swipe-back gesture) so you can ask "discard '
                'changes?" before the screen actually closes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              "Open the form below, type something, then try to go back "
              "using the back button/gesture (or the AppBar's back arrow) "
              "— you'll be asked to confirm.",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _EditFormScreen()),
                );
              },
              icon: const Icon(Icons.edit_outlined),
              label: const Text("Open Edit Form"),
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

// ── The actual screen that guards against accidental back navigation ─
class _EditFormScreen extends StatefulWidget {
  const _EditFormScreen();

  @override
  State<_EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<_EditFormScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _hasUnsavedChanges = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _confirmDiscard() async {
    final shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Discard changes?"),
        content: const Text(
          "You have unsaved changes. If you leave now, they will be lost.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Keep Editing"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Discard", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    // If the user confirmed, THEN we actually close the screen.
    if (shouldDiscard == true && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // canPop: false BLOCKS the back button/gesture from closing the
      // screen automatically whenever there are unsaved changes.
      canPop: !_hasUnsavedChanges,

      // Fires every time the user tries to go back — didPop tells us
      // whether the pop was actually allowed to happen.
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return; // it already closed — nothing to do
        _confirmDiscard(); // it was blocked — ask the user first
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Note")),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _hasUnsavedChanges
                      ? const Color(0xFFFEF3C7)
                      : const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      _hasUnsavedChanges
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_outline,
                      color: _hasUnsavedChanges
                          ? Colors.orange.shade700
                          : Colors.green.shade600,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _hasUnsavedChanges
                          ? "Unsaved changes — back is guarded"
                          : "No changes — back works normally",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                maxLines: 4,
                onChanged: (text) {
                  setState(() {
                    _hasUnsavedChanges = text.trim().isNotEmpty;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Type a note...",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
