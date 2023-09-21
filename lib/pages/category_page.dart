import 'package:flutter/material.dart';
import 'package:quizzy_mind/pages/game_page.dart';
import 'package:quizzy_mind/pages/utils/designs/fancy_button.dart';

import '../pages/utils/animation/polar_bear_animation.dart';

class CategoryPage extends StatefulWidget {
  final String? categoryImageTitle;
  final String? categoryImageBackground;
  final Color? categoryBackgroundColor;
  final String? category;

  CategoryPage({
    required this.categoryImageTitle,
    required this.categoryImageBackground,
    required this.categoryBackgroundColor,
    required this.category,
  });

  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {
  double? _deviceHeight, _deviceWidth;
  double _currentDifficultyLevel = 0;
  final List<String> _difficultyTexts = ["Easy", "Medium", "Hard"];

  String? categoryImageTitle;
  String? categoryImageBackground;
  Color? categoryBackgroundColor;
  String? category;

  @override
  void initState() {
    super.initState();
    // Initialize the state variables with values from the widget.
    categoryImageTitle = widget.categoryImageTitle;
    categoryImageBackground = widget.categoryImageBackground;
    categoryBackgroundColor = widget.categoryBackgroundColor;
    category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: _deviceHeight! * .40,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  PolarBearWidget(),
                  _quizTitle(),
                  const SizedBox(
                    height: 50,
                  ),
                  _difficultySlider(),
                  const SizedBox(
                    height: 80,
                  ),
                  _startGameButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//fucntion for title
  Widget _quizTitle() {
    return Column(
      children: [
        Container(
          height: _deviceHeight! * 0.200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(categoryImageTitle!),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Level :",
              style: TextStyle(
                color: Color.fromARGB(255, 81, 54, 54),
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              _difficultyTexts[_currentDifficultyLevel.toInt()],
              style: const TextStyle(
                color: Color.fromARGB(255, 81, 54, 54),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }

//function for slider level
  Widget _difficultySlider() {
    return Slider(
      label: "Diffculty",
      min: 0,
      max: 2,
      divisions: 2,
      activeColor: Color.fromARGB(255, 102, 50, 55),
      value: _currentDifficultyLevel,
      onChanged: (_value) {
        setState(
          () {
            _currentDifficultyLevel = _value;
          },
        );
      },
    );
  }

  //navigate to startgame
  Widget _startGameButton() {
    return Container(
      width: _deviceWidth!,
      height: _deviceHeight! * 0.07,
      child: FancyButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext _context) {
                return GamePage(
                  difficultyLevel:
                      _difficultyTexts[_currentDifficultyLevel.toInt()]
                          .toLowerCase(),
                  categoryBackgroundColor: categoryBackgroundColor,
                  categoryImageBackground: categoryImageBackground,
                  categoryImageTitle: categoryImageTitle,
                  category: category,
                  //just puts :(
                );
              },
            ),
          );
        },
        key: UniqueKey(),
        child: Center(
          child: Text(
            "start",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        size: 23,
        color: Color.fromARGB(255, 147, 162, 177),
      ),
    );
  }
}
