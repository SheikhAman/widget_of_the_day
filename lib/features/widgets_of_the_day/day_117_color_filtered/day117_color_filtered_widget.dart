import 'package:flutter/material.dart';

/// Why use ColorFiltered?
///
/// You'll hit this exact need in almost every real app:
/// • A button that should look "disabled" while a form is invalid
/// • An image that should look dimmed while it's loading
/// • Premium/locked content that should look grayed-out until unlocked
///
/// Instead of keeping a separate gray version of every asset,
/// ColorFiltered lets you apply a gray/dim effect on top of the
/// SAME widget at runtime — no duplicate assets, no extra images.
class Day117ColorFiltered extends StatefulWidget {
  const Day117ColorFiltered({super.key});

  @override
  State<Day117ColorFiltered> createState() => _Day117ColorFilteredState();
}

enum _UseCase { disabledButton, loadingImage, lockedContent }

class _Day117ColorFilteredState extends State<Day117ColorFiltered> {
  _UseCase _selected = _UseCase.disabledButton;
  bool _isFiltered = true; // start "on" so the effect is visible immediately

  static const List<double> _grayscaleMatrix = [
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 117 - ColorFiltered'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Pick a real scenario, then toggle the filter on/off:',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // Scenario picker
            SegmentedButton<_UseCase>(
              segments: const [
                ButtonSegment(
                  value: _UseCase.disabledButton,
                  label: Text('Disabled Button'),
                ),
                ButtonSegment(
                  value: _UseCase.loadingImage,
                  label: Text('Loading Image'),
                ),
                ButtonSegment(
                  value: _UseCase.lockedContent,
                  label: Text('Locked Content'),
                ),
              ],
              selected: {_selected},
              onSelectionChanged: (newSelection) {
                setState(() => _selected = newSelection.first);
              },
            ),

            const SizedBox(height: 28),

            // The actual widget being demonstrated
            Expanded(
              child: Center(
                child: _isFiltered
                    ? ColorFiltered(
                        colorFilter: const ColorFilter.matrix(_grayscaleMatrix),
                        child: _buildScenario(),
                      )
                    : _buildScenario(),
              ),
            ),

            // Explanation for why THIS scenario needs it
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
              onPressed: () => setState(() => _isFiltered = !_isFiltered),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: Text(_isFiltered ? 'Turn Filter Off' : 'Turn Filter On'),
            ),
          ],
        ),
      ),
    );
  }

  // Builds the widget for whichever scenario is selected.
  Widget _buildScenario() {
    switch (_selected) {
      case _UseCase.disabledButton:
        return ElevatedButton.icon(
          onPressed: () {}, // pretend it's disabled visually
          icon: const Icon(Icons.send),
          label: const Text('Submit Form'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          ),
        );

      case _UseCase.loadingImage:
        return Container(
          width: 220,
          height: 140,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.pinkAccent],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.image, color: Colors.white, size: 48),
        );

      case _UseCase.lockedContent:
        return Container(
          width: 220,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.amber.shade700,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.white, size: 32),
              SizedBox(height: 8),
              Text(
                'Premium Feature',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
    }
  }

  // Short "why" text tied to each scenario.
  String _explanationFor(_UseCase useCase) {
    switch (useCase) {
      case _UseCase.disabledButton:
        return 'Why: Users shouldn\'t submit a form with errors. Graying '
            'the button out gives an instant visual cue — no need to '
            'change the button\'s color logic everywhere it\'s used.';
      case _UseCase.loadingImage:
        return 'Why: While an image is loading from the network, dimming '
            'it shows something is "in progress" without needing a '
            'separate placeholder asset.';
      case _UseCase.lockedContent:
        return 'Why: Freemium apps often show locked previews. Graying '
            'the same widget out (instead of building a second "locked" '
            'version) keeps the UI consistent and saves you extra assets.';
    }
  }
}
