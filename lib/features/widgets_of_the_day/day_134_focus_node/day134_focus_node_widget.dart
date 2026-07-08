import 'package:flutter/material.dart';

class Day134FocusNode extends StatefulWidget {
  const Day134FocusNode({super.key});

  @override
  State<Day134FocusNode> createState() => _Day134FocusNodeState();
}

class _Day134FocusNodeState extends State<Day134FocusNode> {
  // One FocusNode per field — each tracks whether ITS field is focused.
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  String _currentlyFocused = "None";

  @override
  void initState() {
    super.initState();
    // Listen to each node so the status text updates live.
    _nameFocus.addListener(() => _updateStatus("Name", _nameFocus));
    _emailFocus.addListener(() => _updateStatus("Email", _emailFocus));
    _phoneFocus.addListener(() => _updateStatus("Phone", _phoneFocus));
  }

  void _updateStatus(String label, FocusNode node) {
    if (node.hasFocus) {
      setState(() => _currentlyFocused = label);
    } else if (_currentlyFocused == label) {
      setState(() => _currentlyFocused = "None");
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 134 - FocusNode')),
      body: GestureDetector(
        // Tapping anywhere outside a field dismisses the keyboard.
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Info Card ────────────────────────────────────────
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
                  '⌨️ FocusNode lets you control the keyboard programmatically '
                  '— jump to the next field on "Next", dismiss the keyboard '
                  'on tap-outside, and know exactly which field is active.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Live focus status ────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFC7D2FE)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.center_focus_strong,
                      size: 16,
                      color: Color(0xFF6366F1),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Focused field: $_currentlyFocused",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Name field ────────────────────────────────────────
              TextField(
                focusNode: _nameFocus,
                textInputAction: TextInputAction.next,
                // Pressing "Next" on the keyboard jumps straight to Email.
                onSubmitted: (_) => _emailFocus.requestFocus(),
                decoration: const InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),

              const SizedBox(height: 14),

              // ── Email field ───────────────────────────────────────
              TextField(
                focusNode: _emailFocus,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => _phoneFocus.requestFocus(),
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),

              const SizedBox(height: 14),

              // ── Phone field ───────────────────────────────────────
              TextField(
                focusNode: _phoneFocus,
                textInputAction: TextInputAction.done,
                // Last field — "Done" dismisses the keyboard instead.
                onSubmitted: (_) => _phoneFocus.unfocus(),
                decoration: const InputDecoration(
                  labelText: "Phone",
                  prefixIcon: Icon(Icons.phone_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),

              const SizedBox(height: 24),

              // ── Programmatic focus buttons ───────────────────────
              const Text(
                "Programmatic controls:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _actionButton("Focus Name", () => _nameFocus.requestFocus()),
                  _actionButton(
                    "Focus Email",
                    () => _emailFocus.requestFocus(),
                  ),
                  _actionButton(
                    "Hide Keyboard",
                    () => FocusScope.of(context).unfocus(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF6366F1),
        side: const BorderSide(color: Color(0xFF6366F1)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 13)),
    );
  }
}
