import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_57_show_search/product_search_delegate.dart';

class Day57ShowSearchWidget extends StatefulWidget {
  const Day57ShowSearchWidget({super.key});

  @override
  State<Day57ShowSearchWidget> createState() => _Day57ShowSearchWidgetState();
}

class _Day57ShowSearchWidgetState extends State<Day57ShowSearchWidget> {
  final List<String> products = [
    'iPhone 15 Pro',
    'Samsung Galaxy S24',
    'MacBook Air M2',
    'Dell XPS 13',
    'AirPods Pro',
    'Sony Headphones',
    'iPad Pro',
    'Apple Watch',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 57 - ShowSearch'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(products),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Tap the search icon to explore products',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}