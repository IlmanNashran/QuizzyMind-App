import 'package:flutter/material.dart';
import 'package:rive/rive.dart'; 

class PolarBearWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: const RiveAnimation.asset("assets/images/polar_bear.riv"),
        ),
      ),
    );
  }
}