import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_mind/pages/game_page_provider.dart';

class GamePage extends StatelessWidget {
  final String difficultyLevel;
  double? _deviceHeight, _deviceWidth;

  GamePageProvider? _gamePageProvider;
  GamePage({required this.difficultyLevel});
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_context) => GamePageProvider(
        context: context,
        difficulityLevel: difficultyLevel,
      ),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(builder: (_context) {
      _gamePageProvider = _context.watch<GamePageProvider>();
      if (_gamePageProvider!.questions != null) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: _deviceHeight! * 0.05,
              ),
              child: _gameUI(),
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }
    });
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionTest(),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: _deviceHeight! * 0.01,
            ),
            _falseButton(),
          ],
        ),
      ],
    );
  }

  Widget _questionTest() {
    return Text(
      _gamePageProvider!
          .getCurrentQuestions(), //get question from provider class
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {
        _gamePageProvider?.answerQuestion("True");
      },
      color: Colors.green,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "true",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      onPressed: () {
        _gamePageProvider?.answerQuestion("False");
      },
      color: Colors.red,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "false",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }
}
