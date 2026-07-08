import 'package:flutter/material.dart';

class Day135Dismissible extends StatefulWidget {
  const Day135Dismissible({super.key});

  @override
  State<Day135Dismissible> createState() => _Day135DismissibleState();
}

class _Day135DismissibleState extends State<Day135Dismissible> {
  final List<String> _emails = [
    "Flutter Weekly Newsletter",
    "Your order has shipped!",
    "Meeting reminder: 3 PM",
    "Invoice #4021 is ready",
    "Welcome to the team 🎉",
    "Password changed successfully",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 135 - Dismissible')),
      body: Column(
        children: [
          // ── Info Card ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Container(
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
                '📧 Swipe left to delete, swipe right to archive — just like '
                'Gmail or WhatsApp. Each direction reveals a different '
                'colored background underneath the item.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: _emails.isEmpty
                ? const Center(
                    child: Text(
                      "No more emails 📭",
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: _emails.length,
                    itemBuilder: (context, index) {
                      final email = _emails[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Dismissible(
                          // A unique key per item — REQUIRED so Flutter knows
                          // exactly which item was swiped, even after the
                          // list re-orders itself.
                          key: ValueKey(email),

                          // Background shown when swiping RIGHT (archive).
                          background: _swipeBackground(
                            color: Colors.blue.shade400,
                            icon: Icons.archive_outlined,
                            alignment: Alignment.centerLeft,
                            label: "Archive",
                          ),

                          // Background shown when swiping LEFT (delete).
                          secondaryBackground: _swipeBackground(
                            color: Colors.red.shade400,
                            icon: Icons.delete_outline,
                            alignment: Alignment.centerRight,
                            label: "Delete",
                          ),

                          // Ask for confirmation BEFORE actually removing —
                          // especially important for a destructive delete.
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              return await _confirmDelete(context);
                            }
                            return true; // archive needs no confirmation
                          },

                          onDismissed: (direction) {
                            final removedEmail = email;
                            setState(() => _emails.removeAt(index));

                            final message =
                                direction == DismissDirection.endToStart
                                ? "Deleted"
                                : "Archived";

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$message: $removedEmail"),
                                action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () {
                                    setState(() {
                                      _emails.insert(index, removedEmail);
                                    });
                                  },
                                ),
                              ),
                            );
                          },

                          child: _emailCard(email),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Delete email?"),
            content: const Text("This action cannot be undone from here."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ) ??
        false; // if dismissed by tapping outside, treat as "cancel"
  }

  Widget _swipeBackground({
    required Color color,
    required IconData icon,
    required Alignment alignment,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: alignment == Alignment.centerLeft
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailCard(String email) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.mail_outline,
              color: Color(0xFF6366F1),
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              email,
              style: const TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
