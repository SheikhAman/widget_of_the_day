import 'package:flutter/material.dart';

/// Day 154: SegmentedButton (Material 3)
/// Real-world Example: Calendar View Switcher
///
/// PROBLEM: Switching between different data views (Day/Week/Month) using
/// custom buttons requires manually handling states, colors, and layout consistency.
///
/// SOLUTION: SegmentedButton is a modern Material 3 widget that provides a
/// standardized way to select one or more options from a row of buttons.
class Day154SegmentedButtonWidget extends StatefulWidget {
  const Day154SegmentedButtonWidget({super.key});

  @override
  State<Day154SegmentedButtonWidget> createState() =>
      _Day154SegmentedButtonWidgetState();
}

enum CalendarView { day, week, month, year }

class _Day154SegmentedButtonWidgetState
    extends State<Day154SegmentedButtonWidget> {
  // Current selection state
  CalendarView _currentView = CalendarView.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(title: const Text('Day 154 - SegmentedButton')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select View Perspective:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),

              // 1. THE SEGMENTED BUTTON (Material 3)
              SegmentedButton<CalendarView>(
                segments: const <ButtonSegment<CalendarView>>[
                  ButtonSegment<CalendarView>(
                    value: CalendarView.day,
                    label: Text('Day'),
                    icon: Icon(Icons.calendar_view_day_outlined),
                  ),
                  ButtonSegment<CalendarView>(
                    value: CalendarView.week,
                    label: Text('Week'),
                    icon: Icon(Icons.calendar_view_week_outlined),
                  ),
                  ButtonSegment<CalendarView>(
                    value: CalendarView.month,
                    label: Text('Month'),
                    icon: Icon(Icons.calendar_view_month_outlined),
                  ),
                  ButtonSegment<CalendarView>(
                    value: CalendarView.year,
                    label: Text('Year'),
                    icon: Icon(Icons.calendar_today_outlined),
                  ),
                ],
                selected: <CalendarView>{_currentView},
                onSelectionChanged: (Set<CalendarView> newSelection) {
                  setState(() {
                    _currentView = newSelection.first;
                  });
                },
                // Recruiter-impressive: Custom styling for M3 feel
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.indigo.withValues(alpha: 0.1);
                    }
                    return null;
                  }),
                ),
              ),
              const SizedBox(height: 50),

              // 2. DYNAMIC CONTENT PREVIEW
              _buildViewContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewContent() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(_getIconForView(_currentView), size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            Text(
              'Currently viewing by: ${_currentView.name.toUpperCase()}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Showing events and schedules for the selected ${_currentView.name}ly timeframe.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForView(CalendarView view) {
    switch (view) {
      case CalendarView.day:
        return Icons.today;
      case CalendarView.week:
        return Icons.view_week;
      case CalendarView.month:
        return Icons.calendar_month;
      case CalendarView.year:
        return Icons.calendar_today;
    }
  }
}
