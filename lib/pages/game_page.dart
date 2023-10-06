import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_mind/pages/game_end_page.dart';
import 'package:quizzy_mind/pages/game_page_provider.dart';
import 'package:quizzy_mind/pages/utils/animation/polar_bear_animation.dart';
import 'package:quizzy_mind/pages/utils/designs/fancy_button.dart';
import 'package:lottie/lottie.dart';

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
  bool? isCorrect;

  GamePageProvider? _gamePageProvider;

  String? categoryImageTitle;
  String? categoryImageBackground;
  Color? categoryBackgroundColor;
  String? difficultyLevel;
  String? category;
  int allQuestionNumberCount = 1;

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
      ),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(builder: (_context) {
      _gamePageProvider = _context.watch<GamePageProvider>();
      if (_gamePageProvider!.questions != null) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: _deviceHeight! * .320,
                decoration: BoxDecoration(
                  color: categoryBackgroundColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(categoryImageBackground!),
                    opacity: 1.8,
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
        return Scaffold(
          backgroundColor: Colors
              .white, // Set the background color of the entire page to white
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animation/hamster.json', // Replace with the path to your Lottie animation file
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                    height:
                        16), // Adjust the spacing between animation and text as needed
                Text(
                  'Loading...', // Your loading text
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors
                        .black, // Set the text color to black or any other color you prefer
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }

  Widget _gameUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _questionTest(),
        _answerButtons(),
        _checkAnswerButton(),
      ],
    );
  }

  Widget _questionTest() {
    return Container(
      height: _deviceHeight! * 0.25,
      width: _deviceWidth!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: _deviceWidth! * 0.07,
              child: Text(
                allQuestionNumberCount.toString(),
                style: const TextStyle(
                    color: Color.fromARGB(255, 81, 54, 54),
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              )),
          Container(
            width: _deviceWidth! * 0.73,
            child: Text(
              _gamePageProvider!
                  .getCurrentQuestions(), //get question from provider class
              style: const TextStyle(
                  color: Color.fromARGB(255, 81, 54, 54),
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  Widget _answerButtons() {
    List<String> answerChoices = _gamePageProvider!.getAnswerChoices();

    return Container(
      height: _deviceHeight! * 0.34,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(answerChoices.length, (index) {
          final choice = answerChoices[index];
          bool isSelected = _selectedAnswer == choice;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  _selectedAnswer = choice;
                  _isAnswerSelected = true; // An answer is now selected
                });
              },
              color: isSelected
                  ? const Color.fromARGB(
                      255, 92, 116, 202) // Change color for selected button
                  : const Color.fromARGB(255, 255, 255, 255),
              // Default color
              minWidth: _deviceWidth!,
              height: _deviceHeight! * 0.06,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  choice,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white // Change text color for selected button
                        : const Color.fromARGB(
                            255, 122, 118, 118), // Default text color
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _checkAnswerButton() {
    bool answerSelected = _isAnswerSelected;
    String correctionAnswer = ""; //show user the correct answer

    return Container(
      height: _deviceHeight! * 0.061,
      width: _deviceWidth!,
      child: FancyButton(
        key: UniqueKey(),

        onPressed: answerSelected
            ? () {
                // If an answer is selected, check the answer
                _gamePageProvider!.answerQuestion(_selectedAnswer!);
                isCorrect = _gamePageProvider!.isCorrect;
                correctionAnswer = _gamePageProvider!.correctionAnswer;

                setState(() {
                  _isAnswerSelected = false; // Reset selection
                });

                showModalBottomSheet(
                  context: context,
                  isDismissible:
                      false, // Prevent dismissing the modal without clicking "Continue"
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      width: _deviceHeight!,
                      color: isCorrect == true
                          ? const Color.fromARGB(255, 162, 254, 165)
                          : Colors.red[100],
                      child: Column(
                        children: [
                          Container(
                            height: _deviceHeight! * 0.20,
                            width: _deviceWidth!,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: isCorrect == true
                                  ? const Text(
                                      "Good Job",
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Color.fromARGB(255, 43, 190, 65),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Correct Answer:",
                                          style: TextStyle(
                                            fontSize: 27,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          correctionAnswer,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Color.fromARGB(
                                                255, 163, 44, 36),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45),
                            child: Container(
                              width: _deviceWidth! * 30,
                              child: FancyButton(
                                key: UniqueKey(),
                                size: 40,
                                color: isCorrect == true
                                    ? Colors.green
                                    : Colors.red,
                                child: const Center(
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: allQuestionNumberCount < 10
                                    ? () {
                                        _gamePageProvider!.getNewQuestions();
                                        allQuestionNumberCount++;
                                        Navigator.pop(context);
                                      }
                                    : () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => GameEndPage(
                                                score: _gamePageProvider!
                                                    .correctCount
                                                    .toString(),
                                                maxQuestions: "10",
                                                difficulityLevel:
                                                    difficultyLevel!,
                                              ),
                                            ));
                                      },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            : null,

        size: 40,
        color: answerSelected
            ? const Color.fromARGB(255, 69, 234, 36)
            : Colors.white,
        child: Center(
          child: Text(
            "Check Answer",
            style: TextStyle(
                color: answerSelected
                    ? Colors.white
                    : const Color.fromARGB(255, 114, 112, 112)),
          ),
        ), // Disable the button if no answer is selected
      ),
    );
  }
}
