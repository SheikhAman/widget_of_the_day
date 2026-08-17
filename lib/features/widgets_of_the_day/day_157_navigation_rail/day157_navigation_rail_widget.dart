import 'package:flutter/material.dart';

/// Day 157: NavigationRail (Material 3)
/// Real-world Example: Tablet & Large Screen Admin Dashboard
///
/// PROBLEM: Side navigation for tablets and foldables often takes up too much
/// horizontal space if implemented as a full Drawer.
///
/// SOLUTION: NavigationRail provides a compact, vertical side navigation
/// pattern. It is the official Material 3 way to navigate on larger screens
/// or when you need permanent, quick access to top-level destinations.
class Day157NavigationRailWidget extends StatefulWidget {
  const Day157NavigationRailWidget({super.key});

  @override
  State<Day157NavigationRailWidget> createState() =>
      _Day157NavigationRailWidgetState();
}

class _Day157NavigationRailWidgetState
    extends State<Day157NavigationRailWidget> {
  int _selectedIndex = 0;
  bool _isExtended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Day 157 - NavigationRail'),
        // Add a toggle to show recruiters you know how to handle "Extended" mode
        actions: [
          IconButton(
            onPressed: () => setState(() => _isExtended = !_isExtended),
            icon: Icon(
              _isExtended
                  ? Icons.keyboard_double_arrow_left
                  : Icons.keyboard_double_arrow_right,
            ),
            tooltip: 'Toggle Rail Labels',
          ),
        ],
      ),
      body: Row(
        children: [
          // 1. THE NAVIGATION RAIL
          NavigationRail(
            selectedIndex: _selectedIndex,
            extended: _isExtended,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            // Branding header
            leading: FloatingActionButton(
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            // Bottom footer
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                  ),
                ),
              ),
            ),
            labelType: _isExtended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('Bookmarks'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),

          const VerticalDivider(thickness: 1, width: 1),

          // 2. MAIN CONTENT AREA
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selected: ${_getLabel(_selectedIndex)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Try toggling the arrow in the AppBar to see\nthe "Extended" mode for larger screens.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Favorites';
      case 2:
        return 'Bookmarks';
      case 3:
        return 'Settings';
      default:
        return '';
    }
  }
}
