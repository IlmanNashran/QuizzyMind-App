import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_mind/pages/game_end_page.dart';
import 'package:quizzy_mind/pages/game_page_provider.dart';
import 'package:quizzy_mind/pages/utils/animation/polar_bear_animation.dart';

class GamePage extends StatefulWidget {
  final String difficultyLevel;
  final String? categoryImageTitle;
  final String? categoryImageBackground;
  final Color? categoryBackgroundColor;
  final String? category;

  GamePage({
    required this.difficultyLevel,
    required this.categoryImageTitle,
    required this.categoryBackgroundColor,
    required this.categoryImageBackground,
    required this.category,
  });
  @override
  State<StatefulWidget> createState() {
    return _GamePageState();
  }
}

class _GamePageState extends State<GamePage> {
  double? _deviceHeight, _deviceWidth;
  String? _selectedAnswer; // Track the selected answer
  bool _isAnswerSelected = false; // Track whether an answer is selected

  GamePageProvider? _gamePageProvider;

  String? categoryImageTitle;
  String? categoryImageBackground;
  Color? categoryBackgroundColor;
  String? difficultyLevel;
  String? category;
  bool? checkAnswer = true;

  @override
  void initState() {
    super.initState();
    // Initialize the state variables with values from the widget.
    categoryImageTitle = widget.categoryImageTitle;
    categoryImageBackground = widget.categoryImageBackground;
    categoryBackgroundColor = widget.categoryBackgroundColor;
    difficultyLevel = widget.difficultyLevel;
    category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_context) => GamePageProvider(
        context: context,
        difficulityLevel: difficultyLevel!,
        category: category!,
        checkAnswer: checkAnswer!,
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
        SizedBox(
          height: 5,
        ),
        _answerButtons(),
        SizedBox(
          height: 20,
        ),
        _checkAnswerButton(),
      ],
    );
  }

  Widget _questionTest() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Text(
        _gamePageProvider!
            .getCurrentQuestions(), //get question from provider class
        style: const TextStyle(
            color: Color.fromARGB(255, 81, 54, 54),
            fontSize: 20,
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
            setState(() {
              _selectedAnswer = choice;
              _isAnswerSelected = true; // An answer is now selected
            });
          },
          color: Colors.blue, // Customize the button color
          minWidth: _deviceWidth!,
          height: _deviceHeight! * 0.05,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            choice,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _checkAnswerButton() {
    bool showContinueButton = _isAnswerSelected;


    return ElevatedButton(
      onPressed: showContinueButton
          ? () {
              // If an answer is selected, check the answer
              _gamePageProvider!.answerQuestion(_selectedAnswer!);

              setState(() {
                _isAnswerSelected = false; // Reset selection
              });

              showModalBottomSheet(
                context: context,
                isDismissible:
                    false, // Prevent dismissing the modal without clicking "Continue"
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    width: _deviceHeight!,
                    child: ElevatedButton(
                        child: const Text("Continue"),
                        onPressed: () {
                          String checkAnswerClick = _gamePageProvider!
                              .getCurrentQuestions()
                              .toString();
                          print(checkAnswerClick);
                          if (checkAnswerClick == "Finish 10 Question") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (GameEndPage(
                                      score: "9", maxQuestions: "10"))),
                            );
                          } else {
                            setState(() {
                              checkAnswer = true;
                            });
                            Navigator.pop(context);
                          }
                        }),
                  );
                },
              );

              // Reset _isAnswerSelected to false
            }
          : null, // Disable the button if no answer is selected

      child: const Text(
        "Check Answer",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 10, 10),
          fontSize: 20,
        ),
      ),
    );
  }
}
