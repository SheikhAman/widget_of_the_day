import 'package:flutter/material.dart';

class Day55StepperWidget extends StatefulWidget {
  const Day55StepperWidget({super.key});

  @override
  State<Day55StepperWidget> createState() => _Day55StepperWidgetState();
}

class _Day55StepperWidgetState extends State<Day55StepperWidget> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 55 - Stepper'),
      ),
      body: Stepper(
        currentStep: _currentStep,

        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },

        onStepContinue: () {
          if (_currentStep < 3) {
            setState(() {
              _currentStep++;
            });
          }
        },

        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },

        steps: const [
          Step(
            title: Text('Profile'),
            content: Text(
              'Enter your personal information.',
            ),
          ),
          Step(
            title: Text('Education'),
            content: Text(
              'Add your academic qualifications.',
            ),
          ),
          Step(
            title: Text('Experience'),
            content: Text(
              'Provide your work experience.',
            ),
          ),
          Step(
            title: Text('Submit'),
            content: Text(
              'Review and submit your application.',
            ),
          ),
        ],
      ),
    );
  }
}