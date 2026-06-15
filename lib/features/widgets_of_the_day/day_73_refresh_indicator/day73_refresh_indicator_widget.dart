import 'package:flutter/material.dart';

class Day73RefreshIndicatorWidget extends StatefulWidget {
  const Day73RefreshIndicatorWidget({super.key});

  @override
  State<Day73RefreshIndicatorWidget> createState() =>
      _Day73RefreshIndicatorWidgetState();
}

class _Day73RefreshIndicatorWidgetState
    extends State<Day73RefreshIndicatorWidget> {
  List<int> items = List.generate(5, (index) => index);

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      items = List.generate(5, (index) => index + DateTime.now().second);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 73 - RefreshIndicator'),
      ),

      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.teal,
        onRefresh: refreshData,

        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Image.network(
                'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?auto=format&fit=crop&w=1200&q=80',
                height: 200,
                fit: BoxFit.cover,
              );
            }

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: ListTile(
                leading: const Icon(Icons.sports_cricket),
                title: Text('IPL Match Item ${items[index - 1]}'),
                subtitle: const Text('Pull down to refresh data'),
              ),
            );
          },
        ),
      ),
    );
  }
}