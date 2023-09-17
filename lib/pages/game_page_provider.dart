import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'package:provider/provider.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  final String difficulityLevel;

  List? questions; //get query api input
  int _currentQuestionCount = 0;
  int _correctCount = 0;

  BuildContext context;

  GamePageProvider({required this.context, required this.difficulityLevel}) {
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    _getQuestionsFromApi();
  }

  //function for get api data qeury
  Future<void> _getQuestionsFromApi() async {
    print(difficulityLevel);
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'multiple',
        'difficulty': difficulityLevel,
        'category': '23',
      }, //get url attribute query
    );
    var _data = jsonDecode(
      _response.toString(),
    );
    questions = _data["results"];
    print(_data);
    notifyListeners();
  }

  String getCurrentQuestions() {
    return questions![_currentQuestionCount]["question"];
  }

  List<String> getAnswerChoices() {
    List<String> choices = [];
    if (questions != null) {
      List<dynamic> incorrectAnswers =
          questions![_currentQuestionCount]["incorrect_answers"];
      String correctAnswer =
          questions![_currentQuestionCount]["correct_answer"];
      choices.addAll(incorrectAnswers.map((answer) => answer.toString()));
      choices.add(correctAnswer);
      choices.shuffle(); // Shuffle the answer choices
    }
    return choices;
  }

  void answerQuestion(String selectedAnswer) async {
    String correctAnswer = questions![_currentQuestionCount]["correct_answer"];

    bool isCorrect = (selectedAnswer == correctAnswer);
    _correctCount += isCorrect ? 1 : 0;
    _currentQuestionCount++;

    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          title: Icon(
            isCorrect ? Icons.check_circle : Icons.cancel_sharp,
            color: Colors.white,
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);

    if (_currentQuestionCount == _maxQuestions) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  void endGame() async {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          title: const Text(
            "End Game!",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          content: Text("Score: $_correctCount/$_maxQuestions"),
        );
      },
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pop(context);
  }
}
