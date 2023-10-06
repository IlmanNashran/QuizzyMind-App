import 'package:flutter/material.dart';
import 'package:rive/rive.dart'; // Make sure to import the necessary packages

class PolarBearWidget extends StatelessWidget {
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 180,
          child: const RiveAnimation.asset(
            "assets/images/polar_bear.riv",
          ),
        ),
      ),
    );
  }
}
