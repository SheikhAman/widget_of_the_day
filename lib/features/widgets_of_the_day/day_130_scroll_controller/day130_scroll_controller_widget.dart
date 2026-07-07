import 'dart:async';
import 'package:flutter/material.dart';

class Day130ScrollController extends StatefulWidget {
  const Day130ScrollController({super.key});

  @override
  State<Day130ScrollController> createState() => _Day130ScrollControllerState();
}

class _Day130ScrollControllerState extends State<Day130ScrollController> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _items = List.generate(20, (i) => i + 1);

  double _scrollPercent = 0;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    // Listen to every scroll change to update the live info panel,
    // and to detect when the user is near the bottom (pagination).
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final position = _scrollController.position;

    // 1. Calculate how far down the list we are, as a percentage.
    if (position.maxScrollExtent > 0) {
      setState(() {
        _scrollPercent = position.pixels / position.maxScrollExtent;
      });
    }

    // 2. Reach-end detection: if we're within 200px of the bottom,
    //    and we're not already loading, load more items.
    final nearBottom = position.pixels >= position.maxScrollExtent - 200;

    if (nearBottom && !_isLoadingMore) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() => _isLoadingMore = true);

    // Simulate a network delay, like fetching the next page from an API.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() {
      final nextStart = _items.length + 1;
      _items.addAll(List.generate(10, (i) => nextStart + i));
      _isLoadingMore = false;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 130 - ScrollController')),
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
                '📊 ScrollController tracks the live scroll position, lets '
                'you jump anywhere programmatically, and can detect '
                'when the user nears the bottom — perfect for infinite '
                'scrolling pagination, no package needed.',
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

          // ── Live scroll progress bar ─────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _scrollPercent.clamp(0.0, 1.0),
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation(
                        Color(0xFF6366F1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "${(_scrollPercent * 100).toStringAsFixed(0)}%",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Jump buttons ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _scrollToTop,
                    icon: const Icon(Icons.arrow_upward, size: 18),
                    label: const Text("Top"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _scrollToBottom,
                    icon: const Icon(Icons.arrow_downward, size: 18),
                    label: const Text("Bottom"),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── The scrollable list itself ───────────────────────────
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _items.length + 1, // +1 for the loading footer
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: _isLoadingMore
                          ? const CircularProgressIndicator(
                              color: Color(0xFF6366F1),
                            )
                          : const Text(
                              "Scroll down to load more",
                              style: TextStyle(color: Colors.black45),
                            ),
                    ),
                  );
                }

                final item = _items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      "Item $item",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
