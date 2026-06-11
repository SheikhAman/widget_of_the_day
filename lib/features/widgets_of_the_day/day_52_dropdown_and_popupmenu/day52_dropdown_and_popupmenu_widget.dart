import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_52_dropdown_and_popupmenu/screens/settings_screen.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_52_dropdown_and_popupmenu/screens/share_screen.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_52_dropdown_and_popupmenu/screens/signin_screen.dart';


class Day52DropdownAndPopupMenuWidget extends StatefulWidget {
  const Day52DropdownAndPopupMenuWidget({super.key});

  @override
  State<Day52DropdownAndPopupMenuWidget> createState() =>
      _Day52DropdownAndPopupMenuWidgetState();
}

class _Day52DropdownAndPopupMenuWidgetState
    extends State<Day52DropdownAndPopupMenuWidget> {
  final List<String> departments = [
    'Flutter',
    'Backend',
    'UI/UX',
    'QA',
  ];

  String selectedDepartment = 'Flutter';

  void handleMenuSelection(String value) {
    switch (value) {
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SettingsScreen(),
          ),
        );
        break;

      case 'Share':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ShareScreen(),
          ),
        );
        break;

      case 'Sign Out':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SignInScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 52 - Dropdown & PopupMenu'),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleMenuSelection,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'Settings',
                child: Text('Settings'),
              ),
              PopupMenuItem(
                value: 'Share',
                child: Text('Share'),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: 'Sign Out',
                child: Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Department',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: selectedDepartment,
                isExpanded: true,
                underline: const SizedBox(),
                items: departments.map((department) {
                  return DropdownMenuItem(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.business_center),
                title: const Text('Selected Department'),
                subtitle: Text(selectedDepartment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}