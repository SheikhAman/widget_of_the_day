import 'package:flutter/material.dart';

class Day46TableWidget extends StatelessWidget {
  const Day46TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 46 - Table Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// ================= SIMPLE DATA TABLE =================
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Table(
                border: TableBorder.all(color: Colors.black12),
                columnWidths: const {
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(0.5),
                },
                children: const [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.black12),
                    children: [
                      _HeaderCell('No'),
                      _HeaderCell('First Name'),
                      _HeaderCell('Last Name'),
                      _HeaderCell('Age'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _DataCell('1'),
                      _DataCell('Md.'),
                      _DataCell('Siam'),
                      _DataCell('27'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _DataCell('2'),
                      _DataCell('Jasia'),
                      _DataCell('Khatun'),
                      _DataCell('20'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _DataCell('3'),
                      _DataCell('Mahmuda'),
                      _DataCell('Khatun'),
                      _DataCell('31'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// ================= COLOR GRID TABLE =================
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Table(
                border: TableBorder.all(color: Colors.black12),
                children: [
                  TableRow(
                    children: [
                      _ColorBox(Colors.blue),
                      _ColorBox(Colors.orange),
                      _ColorBox(Colors.green),
                      _ColorBox(Colors.red),
                    ],
                  ),
                  TableRow(
                    children: [
                      _ColorBox(Colors.black),
                      _ColorBox(Colors.cyan),
                      _ColorBox(Colors.amber),
                      _ColorBox(Colors.purple),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// ================= HEADER CELL =================
class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

/// ================= DATA CELL =================
class _DataCell extends StatelessWidget {
  final String text;

  const _DataCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(text),
      ),
    );
  }
}

/// ================= COLOR BOX =================
class _ColorBox extends StatelessWidget {
  final Color color;

  const _ColorBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: color,
    );
  }
}