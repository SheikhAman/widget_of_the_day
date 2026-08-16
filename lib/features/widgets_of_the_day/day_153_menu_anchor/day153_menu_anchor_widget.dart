import 'package:flutter/material.dart';

/// Day 153: MenuAnchor (Material 3)
/// Real-world Example: Advanced Profile & Action Menu
///
/// PROBLEM: Traditional PopupMenus are often limited in styling and don't
/// easily allow custom anchor widgets (like an Avatar or a complex Button).
///
/// SOLUTION: MenuAnchor allows any widget to act as an "anchor" and provides
/// a standard Material 3 menu that can be triggered by taps or other events.
class Day153MenuAnchorWidget extends StatefulWidget {
  const Day153MenuAnchorWidget({super.key});

  @override
  State<Day153MenuAnchorWidget> createState() => _Day153MenuAnchorWidgetState();
}

class _Day153MenuAnchorWidgetState extends State<Day153MenuAnchorWidget> {
  String _selectedAction = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Day 153 - MenuAnchor'),
        actions: [
          // 1. MENU ANCHOR IN APPBAR (Common Location)
          MenuAnchor(
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(Icons.more_vert),
                tooltip: 'Show menu',
              );
            },
            menuChildren: [
              MenuItemButton(
                leadingIcon: const Icon(Icons.refresh),
                onPressed: () => _updateAction('Refreshed Data'),
                child: const Text('Refresh'),
              ),
              MenuItemButton(
                leadingIcon: const Icon(Icons.share),
                onPressed: () => _updateAction('Shared Content'),
                child: const Text('Share'),
              ),
              const Divider(),
              MenuItemButton(
                leadingIcon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _updateAction('Deleted Item'),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 2. MENU ANCHOR WITH CUSTOM WIDGET (Profile Style)
            const Text(
              'Tap the Profile Card to see MenuAnchor in action:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            MenuAnchor(
              builder: (context, controller, child) {
                return GestureDetector(
                  onTap: () => controller.isOpen
                      ? controller.close()
                      : controller.open(),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.indigo.withValues(alpha: 0.2),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.indigo,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Sheikh Aman',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Pro Member',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 24),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              menuChildren: [
                SubmenuButton(
                  menuChildren: [
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.light_mode_outlined),
                      onPressed: () => _updateAction('Light Mode Set'),
                      child: const Text('Light'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.dark_mode_outlined),
                      onPressed: () => _updateAction('Dark Mode Set'),
                      child: const Text('Dark'),
                    ),
                  ],
                  child: const Text('Theme'),
                ),
                MenuItemButton(
                  leadingIcon: const Icon(Icons.settings_outlined),
                  onPressed: () => _updateAction('Settings Opened'),
                  child: const Text('Account Settings'),
                ),
                const Divider(),
                MenuItemButton(
                  leadingIcon: const Icon(Icons.logout),
                  onPressed: () => _updateAction('Logged Out'),
                  child: const Text('Sign Out'),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              'Last Action: $_selectedAction',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _updateAction(String action) {
    setState(() => _selectedAction = action);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(action),
        behavior: SnackBarBehavior.floating,
        width: 200,
      ),
    );
  }
}
