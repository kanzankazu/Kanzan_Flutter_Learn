// ignore_for_file: prefer_const_constructors

import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class StepperSample extends StatefulWidget {
  const StepperSample({super.key});

  @override
  State<StepperSample> createState() => _StepperSampleState();
}

class _StepperSampleState extends State<StepperSample> {
  int _currentStep = 0;

  onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  onStepContinue() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep = _currentStep + 1;
      });
    }
  }

  onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep = _currentStep - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      Step(title: Text("Langkah 1"), content: Text("Ini Langkah Pertama"), state: handleStep(0)),
      Step(title: Text("Langkah 2"), content: Text("Ini Langkah Kedua"), state: handleStep(1)),
      Step(title: Text("Langkah 3"), content: Text("Ini Langkah Ketiga"), state: handleStep(2)),
      Step(title: Text("Langkah 4"), content: Text("Ini Langkah Empat"), state: handleStep(3)),
    ];

    return Scaffold(
      appBar: CustomAppBar(title: "Stepper Page"),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              elevation: 0,
              connectorColor: MaterialStatePropertyAll(Colors.blue),
              type: StepperType.horizontal,
              currentStep: _currentStep,
              onStepTapped: onStepTapped,
              onStepContinue: onStepContinue,
              onStepCancel: onStepCancel,
              steps: steps,
            ),
          ),
          Expanded(
            flex: 1,
            child: Stepper(
              elevation: 0,
              connectorColor: MaterialStatePropertyAll(Colors.green),
              physics: NeverScrollableScrollPhysics(),
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepTapped: onStepTapped,
              onStepContinue: onStepContinue,
              onStepCancel: onStepCancel,
              steps: steps,
            ),
          ),
        ],
      ),
    );
  }

  StepState handleStep(int i) {
    if (_currentStep == i) {
      return StepState.editing;
    } else if (_currentStep > i) {
      return StepState.complete;
    } else {
      return StepState.disabled;
    }
  }
}
