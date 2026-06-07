import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_27_listwheelscrollview/ampm_item.dart';
import 'hour_item.dart';
import 'minute_item.dart';


class Day27WheelTimePickerWidget extends StatefulWidget {
  const Day27WheelTimePickerWidget({super.key});

  @override
  State<Day27WheelTimePickerWidget> createState() =>
      _Day27WheelTimePickerWidgetState();
}

class _Day27WheelTimePickerWidgetState extends State<Day27WheelTimePickerWidget> {
  int selectedHour = 0;
  int selectedMinute = 0;
  bool isAM = true;

  String get formattedTime {
    final hour = selectedHour.toString().padLeft(2, '0');
    final minute = selectedMinute.toString().padLeft(2, '0');
    final period = isAM ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      appBar: AppBar(
        title: const Text("Day 27 - Wheel Time Picker"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade400,
                Colors.deepPurple.shade900,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TIME DISPLAY
              Text(
                formattedTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 30),

              // WHEELS
              SizedBox(
                height: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildWheel(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 55,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedHour = value;
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 12,
                          builder: (context, index) {
                            return HourItem(hour: index);
                          },
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        ":",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    _buildWheel(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 55,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedMinute = value;
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            return MinuteItem(minute: index);
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    _buildWheel(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 55,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            isAM = value == 0;
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 2,
                          builder: (context, index) {
                            return AmPmItem(isAM: index == 0);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildWheel({required Widget child}) {
  return Container(
    width: 75,
    height: 180,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.08),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.white.withOpacity(0.1),
      ),
    ),
    child: child,
  );
}