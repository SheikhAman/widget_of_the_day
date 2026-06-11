import 'package:flutter/material.dart';

class Day51SwitchesWidget extends StatefulWidget {
  const Day51SwitchesWidget({super.key});

  @override
  State<Day51SwitchesWidget> createState() => _Day51SwitchesWidgetState();
}

class _Day51SwitchesWidgetState extends State<Day51SwitchesWidget> {
  // ---------------- Switch ----------------
  bool isSwitchOn = false;

  // ---------------- Checkbox ----------------
  bool isChecked = false;
  bool selectAll = false;
  bool option1 = false;
  bool option2 = false;

  // ---------------- Radio ----------------
  int selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 51 - Switches'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              // ================= SWITCH =================
              _buildCard(
                title: "Switch",
                child: SwitchListTile(
                  title: Text(isSwitchOn ? "Switch ON" : "Switch OFF"),
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() => isSwitchOn = value);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // ================= CHECKBOX =================
              _buildCard(
                title: "Checkbox",
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text("Select All"),
                      value: selectAll,
                      onChanged: (value) {
                        setState(() {
                          selectAll = value!;
                          option1 = value;
                          option2 = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Option 1"),
                      value: option1,
                      onChanged: (value) {
                        setState(() => option1 = value!);
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Option 2"),
                      value: option2,
                      onChanged: (value) {
                        setState(() => option2 = value!);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ================= RADIO =================
              _buildCard(
                title: "Radio Buttons",
                child: Column(
                  children: [
                    RadioListTile(
                      title: const Text("Option 1"),
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() => selectedRadio = value!);
                      },
                    ),
                    RadioListTile(
                      title: const Text("Option 2"),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() => selectedRadio = value!);
                      },
                    ),
                    RadioListTile(
                      title: const Text("Option 3"),
                      value: 3,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() => selectedRadio = value!);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Reusable Card UI ----------------
  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}