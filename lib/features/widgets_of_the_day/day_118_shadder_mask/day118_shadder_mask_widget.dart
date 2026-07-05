import 'package:flutter/material.dart';

/// Why use ShaderMask?
///
/// ShaderMask lets you paint a gradient (or any shader) ON TOP of a
/// widget and blend it in — instead of just placing a gradient behind
/// or in front of something.
///
/// Two effects you've seen in almost every app:
/// • A "shimmer" that sweeps across loading placeholders or premium text
/// • A soft fade at the edge of a scrollable list, so content doesn't
///   end abruptly
///
/// Both are done with ShaderMask + a gradient — no external packages,
/// no extra images.
class Day118ShaderMask extends StatefulWidget {
  const Day118ShaderMask({super.key});

  @override
  State<Day118ShaderMask> createState() => _Day118ShaderMaskState();
}

enum _Demo { shimmerText, fadingList }

class _Day118ShaderMaskState extends State<Day118ShaderMask>
    with SingleTickerProviderStateMixin {
  _Demo _selected = _Demo.shimmerText;
  bool _isMasked = true;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Drives the shimmer sweep from left to right, then repeats.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 118 - ShaderMask'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Pick an effect, then toggle the mask on/off:',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // Effect picker
            SegmentedButton<_Demo>(
              segments: const [
                ButtonSegment(
                  value: _Demo.shimmerText,
                  label: Text('Shimmer Text'),
                ),
                ButtonSegment(
                  value: _Demo.fadingList,
                  label: Text('Fading List'),
                ),
              ],
              selected: {_selected},
              onSelectionChanged: (newSelection) {
                setState(() => _selected = newSelection.first);
              },
            ),

            const SizedBox(height: 28),

            Expanded(
              child: Center(
                child: _selected == _Demo.shimmerText
                    ? _buildShimmerDemo()
                    : _buildFadingListDemo(),
              ),
            ),

            // Explanation for why THIS effect is useful
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _explanationFor(_selected),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),

            ElevatedButton(
              onPressed: () => setState(() => _isMasked = !_isMasked),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: Text(_isMasked ? 'Turn Mask Off' : 'Turn Mask On'),
            ),
          ],
        ),
      ),
    );
  }

  // ── Demo 1: Shimmer sweeping across text ─────────────────────────
  Widget _buildShimmerDemo() {
    const text = Text(
      'Premium Content',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        // Base color shown when the mask is off.
        color: Colors.black,
      ),
    );

    if (!_isMasked) return text;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          // blendMode.srcIn means: "use the shader's color, but keep
          // the child's shape (its alpha/transparency)."
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            // The gradient slides left-to-right based on the animation
            // value, creating the sweeping shine effect.
            return LinearGradient(
              colors: const [Colors.black, Colors.white, Colors.black],
              stops: const [0.35, 0.5, 0.65],
              begin: Alignment(-1 - _controller.value * 2, 0),
              end: Alignment(1 - _controller.value * 2, 0),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: text,
    );
  }

  // ── Demo 2: A list that fades out at the top and bottom ──────────
  Widget _buildFadingListDemo() {
    final list = ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) => Container(
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text('Item $index'),
      ),
    );

    if (!_isMasked) {
      return SizedBox(width: 240, height: 220, child: list);
    }

    return SizedBox(
      width: 240,
      height: 220,
      child: ShaderMask(
        // srcOver blends the gradient's transparency with the list,
        // fading edges to nothing where the gradient is transparent.
        blendMode: BlendMode.dstIn,
        shaderCallback: (bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: [0.0, 0.15, 0.85, 1.0],
          ).createShader(bounds);
        },
        child: list,
      ),
    );
  }

  // Short "why" text tied to each demo.
  String _explanationFor(_Demo demo) {
    switch (demo) {
      case _Demo.shimmerText:
        return 'Why: Shimmer effects tell users "something is loading" or '
            'make premium/locked text feel special — all done with a '
            'moving gradient, no GIFs or extra packages needed.';
      case _Demo.fadingList:
        return 'Why: A hard-cut list edge looks unfinished. Fading the '
            'top and bottom hints there\'s more content to scroll to, '
            'a common pattern in polished, professional UIs.';
    }
  }
}
