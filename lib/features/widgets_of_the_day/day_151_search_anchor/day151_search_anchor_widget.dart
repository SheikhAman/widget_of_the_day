import 'package:flutter/material.dart';

/// Day 151: SearchAnchor (Material 3)
/// Real-world Example: E-commerce Product Search
///
/// PROBLEM: Implementing a search bar with a suggestions dropdown usually
/// requires complex logic for overlays and focus management.
///
/// SOLUTION: SearchAnchor manages the transition between a SearchBar (closed state)
/// and a Search View (open state with suggestions) automatically.

class Day151SearchAnchorWidget extends StatefulWidget {
  const Day151SearchAnchorWidget({super.key});

  @override
  State<Day151SearchAnchorWidget> createState() =>
      _Day151SearchAnchorWidgetState();
}

class _Day151SearchAnchorWidgetState extends State<Day151SearchAnchorWidget> {
  final SearchController _searchController = SearchController();

  // Mock data for our "Grocery Store"
  final List<String> _products = [
    'Apple',
    'Banana',
    'Blueberry',
    'Cherry',
    'Date',
    'Eggplant',
    'Fig',
    'Grape',
    'Honeydew',
    'Kiwi',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 151 - SearchAnchor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. THE SEARCH ANCHOR
            SearchAnchor(
              searchController: _searchController,
              // The search bar shown when the view is closed
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search, color: Colors.indigo),
                  hintText: 'Search for groceries...',
                );
              },
              // The list of suggestions shown when the search bar is tapped
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                    final String keyword = controller.value.text.toLowerCase();

                    // Filter products based on what user typed
                    final Iterable<String> filteredProducts = _products.where(
                      (product) => product.toLowerCase().contains(keyword),
                    );

                    if (filteredProducts.isEmpty) {
                      return [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text('No products found!')),
                        ),
                      ];
                    }

                    return filteredProducts.map((product) {
                      return ListTile(
                        leading: const Icon(Icons.shopping_basket_outlined),
                        title: Text(product),
                        onTap: () {
                          setState(() {
                            controller.closeView(product);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Selected: $product')),
                          );
                        },
                      );
                    });
                  },
            ),
            const SizedBox(height: 40),

            // 2. SHOWING RESULTS
            _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    final query = _searchController.text;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 48,
              color: Colors.indigo,
            ),
            const SizedBox(height: 16),
            Text(
              query.isEmpty ? 'Ready to search' : 'Search Result',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              query.isEmpty
                  ? 'Tap the search bar above to see suggestions.'
                  : 'You searched for: $query',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
