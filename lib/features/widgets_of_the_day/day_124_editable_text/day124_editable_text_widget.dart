import 'package:flutter/material.dart';

class Day124EditableText extends StatefulWidget {
  const Day124EditableText({super.key});

  @override
  State<Day124EditableText> createState() => _Day124EditableTextState();
}

class _Day124EditableTextState extends State<Day124EditableText> {
  // EditableText needs YOU to manage its focus manually —
  // TextField normally does this for you behind the scenes.
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _rawController = TextEditingController(
    text: "Edit me",
  );
  final TextEditingController _fieldController = TextEditingController(
    text: "Edit me",
  );

  @override
  void dispose() {
    _focusNode.dispose();
    _rawController.dispose();
    _fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(title: const Text('Day 124 - EditableText')),
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
                '✏️ TextField is not magic — underneath, it is built on top of '
                'EditableText, plus a Material border, label, and focus '
                'handling. Here you build that raw core yourself.',
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
              "1. Raw EditableText (no decoration)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),

            // Notice: no border, no label, no padding — you get NONE of
            // that for free. EditableText only draws text + a cursor.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: EditableText(
                controller: _rawController,
                focusNode: _focusNode,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                cursorColor: const Color(0xFF6366F1),
                backgroundCursorColor: Colors.grey,
                selectionColor: const Color(0xFF6366F1).withValues(alpha: 0.3),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "↑ That grey box is just a plain Container I styled myself — "
              "EditableText alone gives no border, label, or fill color.",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 28),

            const Text(
              "2. Regular TextField (for comparison)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _fieldController,
              decoration: InputDecoration(
                labelText: "Edit me",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "↑ TextField gives you the label, border, and fill for free — "
              "because it wraps an EditableText with that decoration built in.",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 28),

            _factCard(
              "Both boxes above are editable and show a blinking cursor. "
              "The only real difference is styling — TextField just saves "
              "you from writing that styling and focus logic yourself.",
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
