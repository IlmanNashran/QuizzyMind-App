import 'package:flutter/material.dart';

class CardScore extends StatelessWidget {
  final String? score;
  final String? maxQuestions;
  final String? difficulityLevel;

  const CardScore(
      {required this.score,
      required this.maxQuestions,
      required this.difficulityLevel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2.0, // Adjust the card elevation as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: Color.fromARGB(255, 194, 33, 65),
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20), // Adjust the margin as needed
              child: Row(
                children: [
                  Text(
                    "Quiz Difficulty:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    difficulityLevel!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 20), // Adjust the margin as needed
              child: Row(
                children: [
                  Text(
                    "Correct Answer:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$score/10",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: 20), // Adjust the margin as needed
              child: Row(
                children: [
                  Text(
                    "Score:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$score 0%",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
