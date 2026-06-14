import 'package:flutter/material.dart';

class Day59ScrollbarWidget extends StatelessWidget {
  const Day59ScrollbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 59 - Scrollbar'),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 8,
        radius: const Radius.circular(10),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 25,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return _buildItem(index + 1);
          },
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text('$index'),
        ),
        title: Text('List Item $index'),
        subtitle: const Text('Scrollbar demonstration item'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}