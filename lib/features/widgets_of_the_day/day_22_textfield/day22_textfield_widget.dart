import 'package:flutter/material.dart';

class Day22TextFieldWidget extends StatefulWidget {
  const Day22TextFieldWidget({super.key});

  @override
  State<Day22TextFieldWidget> createState() => _Day22TextFieldWidgetState();
}

class _Day22TextFieldWidgetState extends State<Day22TextFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  String userPost = "";

  void _postText() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      userPost = _controller.text;
    });

    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 22 - TextField"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // OUTPUT BOX (like post preview)
            Expanded(
              child: Center(
                child: Text(
                  userPost.isEmpty ? "Write something..." : userPost,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // INPUT FIELD
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  onPressed: _controller.clear,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // POST BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _postText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.all(14),
                ),
                child: const Text(
                  "POST",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}