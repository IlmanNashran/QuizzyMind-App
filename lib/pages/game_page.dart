import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_mind/pages/game_page_provider.dart';
import 'package:quizzy_mind/pages/utils/animation/polar_bear_animation.dart';

class GamePage extends StatelessWidget {
  final String difficultyLevel;
  double? _deviceHeight, _deviceWidth;

  final String? categoryImageTitle;
  final String? categoryImageBackground;
  final Color? categoryBackgroundColor;

  GamePageProvider? _gamePageProvider;
  GamePage({
    required this.difficultyLevel,
    required this.categoryImageTitle,
    required this.categoryBackgroundColor,
    required this.categoryImageBackground,
  });

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
          body: Stack(
            children: [
              Container(
                height: _deviceHeight! * .346,
                decoration: BoxDecoration(
                  color: categoryBackgroundColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(categoryImageBackground!),
                    opacity: 1.8,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: FractionalTranslation(
                  translation: Offset(0.0, 0.0),
                  child: Container(
                    height: _deviceHeight! * 0.111,
                    width: _deviceWidth! * 0.40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(categoryImageTitle!),
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    PolarBearWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: _deviceHeight! * 0.05,
                      ),
                      child: _gameUI(),
                    ),
                  ],
                ),
              ),
            ],
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionTest(),
        _answerButtons(),
      ],
    );
  }

  Widget _questionTest() {
    return Container(
      height: _deviceHeight! * 0.30,
      child: Text(
        _gamePageProvider!
            .getCurrentQuestions(), //get question from provider class
        style: const TextStyle(
            color: Color.fromARGB(255, 81, 54, 54),
            fontSize: 25,
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _answerButtons() {
    List<String> answerChoices = _gamePageProvider!.getAnswerChoices();

    return Column(
      children: answerChoices.map((choice) {
        return MaterialButton(
          onPressed: () {
            _gamePageProvider?.answerQuestion(choice);
          },
          color: Colors.blue, // Customize the button color
          minWidth: _deviceWidth!,
          height: _deviceHeight! * 0.05,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            choice,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        );
      }).toList(),
    );
  }
}
