import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Day143CupertinoTimerPicker extends StatefulWidget {
  const Day143CupertinoTimerPicker({super.key});

  @override
  State<Day143CupertinoTimerPicker> createState() =>
      _Day143CupertinoTimerPickerState();
}

class _Day143CupertinoTimerPickerState
    extends State<Day143CupertinoTimerPicker> {
  TimeOfDay? _pickedTime;
  Duration _pickedDuration = const Duration(minutes: 5);

  // ── Material: a clock-face picker for a specific TIME OF DAY ──────
  Future<void> _showMaterialTimePicker() async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      setState(() => _pickedTime = result);
    }
  }

  // ── Cupertino: a drum-roll picker for a DURATION (hh:mm:ss) ──────
  void _showCupertinoTimerPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 260,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                "Set Timer Duration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              Expanded(
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hms, // hours:minutes:seconds
                  initialTimerDuration: _pickedDuration,
                  onTimerDurationChanged: (duration) {
                    setState(() => _pickedDuration = duration);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: const Color(0xFF6366F1),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 143 - CupertinoTimerPicker')),
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
                '⏱️ These solve DIFFERENT problems: showTimePicker picks a '
                'specific clock TIME (like "3:30 PM"), while '
                'CupertinoTimerPicker\'s drum-roll picks a DURATION '
                '(like "5 minutes 30 seconds") — the iOS Clock app style.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── Material trigger ───────────────                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ──────────────────────
            _triggerCard(
              icon: Icons.access_time,
              title: "showTimePicker",
              subtitle: "Material clock face — picks a TIME OF DAY",
              color: const Color(0xFF3DDC84),
              onTap: _showMaterialTimePicker,
            ),

            const SizedBox(height: 8),

            Text(
              _pickedTime == null
                  ? "No time picked yet"
                  : "Picked: ${_pickedTime!.format(context)}",
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),

            const SizedBox(height: 24),

            // ── Cupertino trigger ────────────────────────────────────
            _triggerCard(
              icon: Icons.timer_outlined,
              title: "CupertinoTimerPicker",
              subtitle: "iOS drum-roll — picks a DURATION",
              color: Colors.grey.shade800,
              onTap: _showCupertinoTimerPicker,
            ),

            const SizedBox(height: 8),

            Text(
              "Set to: ${_pickedDuration.inHours}h "
              "${_pickedDuration.inMinutes.remainder(60)}m "
              "${_pickedDuration.inSeconds.remainder(60)}s",
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _triggerCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
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
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}
