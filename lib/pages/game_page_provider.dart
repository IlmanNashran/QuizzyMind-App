import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:quizzy_mind/pages/game_end_page.dart';
import 'package:quizzy_mind/pages/game_page.dart';
//import 'package:provider/provider.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  final String difficulityLevel;
  final String category;
  bool checkAnswer;
  String? gameEnd = "Finish 10 Question";

  List? questions; //get query api input
  int _currentQuestionCount = 0;
  int _correctCount = 0;

  BuildContext context;

  GamePageProvider({
    required this.context,
    required this.difficulityLevel,
    required this.category,
    required this.checkAnswer,
  }) {
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
        'category': category,
      }, //get url attribute query
    );
    var _data = jsonDecode(
      _response.toString(),
    );
    questions = _data["results"];
    print(_data);
    print(category);
    notifyListeners();
  }

  String getCurrentQuestions() {
    if (questions != null &&
        _currentQuestionCount >= 0 &&
        _currentQuestionCount < questions!.length) {
      return questions![_currentQuestionCount]["question"];
    } else {
      return gameEnd
          .toString(); // Provide a default message when there are no more questions
    }
  }

//-----------------------------------------------------------------------
  List<String> getAnswerChoices() {
    List<String> choices = [];
    if (questions != null &&
        _currentQuestionCount >= 0 &&
        _currentQuestionCount < questions!.length) {
      List<dynamic> incorrectAnswers =
          questions![_currentQuestionCount]["incorrect_answers"];
      String correctAnswer =
          questions![_currentQuestionCount]["correct_answer"];
      choices.addAll(incorrectAnswers.map((answer) => answer.toString()));
      choices.add(correctAnswer);
      // Shuffle the answer choices
    }
    return choices;
  }

//-----------------------------------------------------------------------

  Future answerQuestion(String selectedAnswer) async {
    String correctAnswer = questions![_currentQuestionCount]["correct_answer"];

    bool isCorrect = (selectedAnswer == correctAnswer);
    _correctCount += isCorrect ? 1 : 0;
    print(checkAnswer);
    if (checkAnswer == true) {
      _currentQuestionCount++;
      notifyListeners();
    } else if (_currentQuestionCount == _maxQuestions) {
      print("dah Habisssss");
    }
  }

//-----------------------------------------------------------------------
}
