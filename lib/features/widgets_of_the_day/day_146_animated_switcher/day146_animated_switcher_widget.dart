import 'package:flutter/material.dart';

class Day146AnimatedSwitcher extends StatefulWidget {
  const Day146AnimatedSwitcher({super.key});

  @override
  State<Day146AnimatedSwitcher> createState() => _Day146AnimatedSwitcherState();
}

class _Day146AnimatedSwitcherState extends State<Day146AnimatedSwitcher> {
  bool _isLoading = false;

  Future<void> _reload() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 146 - AnimatedSwitcher')),
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
                '🔄 AnimatedSwitcher smoothly transitions between two '
                'ENTIRELY DIFFERENT widgets — like a loading spinner '
                'swapping for real content — instead of just animating '
                'a property on the same widget.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ── The swapping content ─────────────────────────────────
            Expanded(
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  // The default transition is a plain fade. We add a
                  // gentle scale on top for a nicer "pop" effect.
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    );
                  },
                  child: _isLoading ? _loadingView() : _contentView(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: _isLoading ? null : _reload,
              icon: const Icon(Icons.refresh),
              label: Text(_isLoading ? "Loading..." : "Reload"),
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

  Widget _loadingView() {
    // KEY REQUIREMENT: every child of AnimatedSwitcher needs a UNIQUE
    // key. Without it, Flutter can't tell "this is a different widget"
    // and won't animate the swap at all.
    return const Column(
      key: ValueKey("loading"),
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(color: Color(0xFF6366F1)),
        SizedBox(height: 16),
        Text("Fetching data...", style: TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _contentView() {
    return Container(
      key: const ValueKey("content"), // different key = different widget
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 40),
          const SizedBox(height: 12),
          const Text(
            "Data loaded!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            "Updated just now",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
