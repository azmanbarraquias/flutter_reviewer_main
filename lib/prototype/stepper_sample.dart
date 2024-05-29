import 'package:flutter/material.dart';

import '../utils/xprint.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Steeper",
          ),
          centerTitle: true,
        ),
        body: const Home(),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentStep = 0;

  List<Step> stepList() => [
        Step(
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          title: const Text("Account"),
          content: const Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 1,
          state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          title: const Text("Address"),
          content: const Center(
            child: Text("Address"),
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          state: StepState.complete,
          title: const Text("Confirm"),
          content: const Center(
            child: Text("Confirm"),
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      elevation: 5,
      type: StepperType.horizontal,
      steps: stepList(),
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < (stepList().length - 1)) {
          setState(() {
            _currentStep++;
          });
        } else {
          xPrint('Done');
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep--;
          });
        }
      },
    );
  }
}
