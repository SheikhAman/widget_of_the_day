import 'package:flutter/material.dart';

/// Day 152: SearchBar (Material 3)
/// Real-world Example: Contact List Filtering
///
/// PROBLEM: Creating a search input that looks modern and follows Material 3
/// design usually requires lots of custom decoration on a TextField.
///
/// SOLUTION: SearchBar provides a ready-to-use M3 search component with
/// built-in support for leading icons, trailing actions, and standard styling.
class Day152SearchBarWidget extends StatefulWidget {
  const Day152SearchBarWidget({super.key});

  @override
  State<Day152SearchBarWidget> createState() => _Day152SearchBarWidgetState();
}

class _Day152SearchBarWidgetState extends State<Day152SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  // Sample Data: Professional Contact List
  final List<Map<String, String>> _allContacts = [
    {'name': 'Alex Johnson', 'role': 'Senior Developer'},
    {'name': 'Becca Smith', 'role': 'UI/UX Designer'},
    {'name': 'Charlie Davis', 'role': 'Project Manager'},
    {'name': 'Diana Prince', 'role': 'Tech Lead'},
    {'name': 'Ethan Hunt', 'role': 'QA Engineer'},
    {'name': 'Fiona Gallagher', 'role': 'Product Owner'},
  ];

  List<Map<String, String>> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = _allContacts;
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredContacts = _allContacts
          .where(
            (contact) =>
                contact['name']!.toLowerCase().contains(query.toLowerCase()) ||
                contact['role']!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Day 152 - SearchBar')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // 1. THE SEARCH BAR (Material 3)
            SearchBar(
              controller: _searchController,
              hintText: 'Search contacts or roles...',
              onChanged: _filterSearch,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              leading: const Icon(Icons.search, color: Colors.indigo),
              trailing: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      _filterSearch('');
                    },
                    icon: const Icon(Icons.clear),
                  ),
                const CircleAvatar(
                  radius: 14,
                  child: Text('A', style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 2. SEARCH RESULTS
            Expanded(
              child: _filteredContacts.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      itemCount: _filteredContacts.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final contact = _filteredContacts[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.withValues(
                              alpha: 0.1,
                            ),
                            child: Text(contact['name']![0]),
                          ),
                          title: Text(
                            contact['name']!,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(contact['role']!),
                          trailing: const Icon(Icons.chevron_right, size: 20),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person_search_outlined,
          size: 80,
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: 16),
        Text(
          'No contacts found',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
        Text(
          'Try searching for a name or job title.',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
      ],
    );
  }
}
