import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

//import 'package:provider/provider.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  final String difficulityLevel;
  final String category;

  List? questions; //get query api input
  int _currentQuestionIndexCount = 0;

  int _correctCount = 0;

  bool? _isCorrect; // Add an isCorrect variable to store the result
  String? _correctionAnswer;

// Getter to access isCorrect from outside

  BuildContext context;

  GamePageProvider({
    required this.context,
    required this.difficulityLevel,
    required this.category,
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
        _currentQuestionIndexCount >= 0 &&
        _currentQuestionIndexCount < questions!.length) {
      String question = questions![_currentQuestionIndexCount]["question"];
      String decodedQuestion = parse(question).body!.text;
      return decodedQuestion;
    } else {
      return "No Questions";
    }
  }

//-----------------------------------------------------------------------
  List<String> getAnswerChoices() {
    List<String> choices = [];
    if (questions != null &&
        _currentQuestionIndexCount >= 0 &&
        _currentQuestionIndexCount < questions!.length) {
      List<dynamic> incorrectAnswers =
          questions![_currentQuestionIndexCount]["incorrect_answers"];
      String correctAnswer =
          questions![_currentQuestionIndexCount]["correct_answer"];
      choices.addAll(incorrectAnswers.map((answer) => answer.toString()));
      choices.add(correctAnswer);
    }
    return choices;
  }

//-----------------------------------------------------------------------

  Future answerQuestion(String selectedAnswer) async {
    String correctAnswer =
        questions![_currentQuestionIndexCount]["correct_answer"];

    _isCorrect = (selectedAnswer == correctAnswer);
    _correctionAnswer = correctAnswer;
    _correctCount += _isCorrect! ? 1 : 0;

    notifyListeners();
  }

  //get if the answer by user correct
  bool get isCorrect => _isCorrect!;

  //get correct answer sentence
  String get correctionAnswer => _correctionAnswer!;

  //get new question by adding ++ on index
  int getNewQuestions() {
    notifyListeners();
    return _currentQuestionIndexCount++;
  }

  int get correctCount => _correctCount;

//-----------------------------------------------------------------------
}
