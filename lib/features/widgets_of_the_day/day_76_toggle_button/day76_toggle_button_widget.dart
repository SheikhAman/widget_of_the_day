import 'package:flutter/material.dart';

class Day76ToggleButtonsWidget extends StatefulWidget {
  const Day76ToggleButtonsWidget({super.key});

  @override
  State<Day76ToggleButtonsWidget> createState() =>
      _Day76ToggleButtonsWidgetState();
}

class _Day76ToggleButtonsWidgetState extends State<Day76ToggleButtonsWidget> {
  List<bool> propertyType = [true, false, false]; // required single select
  List<bool> vehicleType = [false, false, false]; // single select
  List<bool> hobbySelect = [true, false, false]; // multi required
  List<bool> pets = [false, false]; // multi optional

  void singleSelect(List<bool> list, int index) {
    setState(() {
      for (int i = 0; i < list.length; i++) {
        list[i] = i == index;
      }
    });
  }

  void multiSelect(List<bool> list, int index, {bool required = false}) {
    setState(() {
      if (required && list.where((e) => e).length == 1 && list[index]) {
        return;
      }
      list[index] = !list[index];
    });
  }

  Widget buildSection(String title, Widget child) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        child,
        const SizedBox(height: 25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 76 - ToggleButtons'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSection(
                "Single + Required (Property Type)",
                ToggleButtons(
                  isSelected: propertyType,
                  borderRadius: BorderRadius.circular(12),
                  selectedColor: Colors.white,
                  fillColor: Colors.purple,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Rent'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Buy'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Sold'),
                    ),
                  ],
                  onPressed: (i) => singleSelect(propertyType, i),
                ),
              ),

              buildSection(
                "Single Selection (Vehicle)",
                ToggleButtons(
                  isSelected: vehicleType,
                  borderRadius: BorderRadius.circular(12),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  children: const [
                    Icon(Icons.car_rental),
                    Icon(Icons.bike_scooter),
                    Icon(Icons.directions_bus),
                  ],
                  onPressed: (i) => singleSelect(vehicleType, i),
                ),
              ),

              buildSection(
                "Multi + Required (Hobbies)",
                ToggleButtons(
                  isSelected: hobbySelect,
                  selectedColor: Colors.white,
                  fillColor: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                  children: const [
                    Icon(Icons.sports_esports),
                    Icon(Icons.music_note),
                    Icon(Icons.travel_explore),
                  ],
                  onPressed: (i) =>
                      multiSelect(hobbySelect, i, required: true),
                ),
              ),

              buildSection(
                "Multi Selection (Pets)",
                ToggleButtons(
                  isSelected: pets,
                  selectedColor: Colors.white,
                  fillColor: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Cat'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Dog'),
                    ),
                  ],
                  onPressed: (i) => multiSelect(pets, i),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}