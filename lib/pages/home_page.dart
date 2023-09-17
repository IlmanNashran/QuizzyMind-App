import 'package:flutter/material.dart';
import '../pages/utils/animation/polar_bear_animation.dart';
import '../pages/utils/designs/card_category_design.dart';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: _deviceHeight! * .50,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(232, 239, 244, 1.000),
              image: DecorationImage(
                image: AssetImage("assets/images/Blob_sharp.png"),
                opacity: 1.8,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _topBar(),
                  PolarBearWidget(),
                  _quizCategory(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//top bar
  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: _deviceHeight! * 0.11,
          width: _deviceWidth! * 0.45,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/Logo_Main_Name.png'),
            ),
          ),
        ),
      ],
    );
  }

  //every quiz category
  Widget _quizCategory() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .85,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          //----------------------------------------General Knowledge------------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "9",
                    categoryImageTitle: "assets/images/General Quiz.png",
                    categoryImageBackground:
                        "assets/images/General_opacity_background.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 171, 246, 168),
                  ),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/general.png",
              title: "General Knowledge",
              backgroundColor: const Color.fromARGB(255, 171, 246, 168),
            ),
          ),
          //--------------------------------------- History -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "23",
                    categoryImageTitle: "assets/images/History Quiz.png",
                    categoryImageBackground:
                        "assets/images/History_opacity_background.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 235, 243, 118),
                  ),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/history.png",
              title: "History",
              backgroundColor: const Color.fromARGB(255, 235, 243, 118),
            ),
          ),
          //--------------------------------------- Computer Science -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "18",
                    categoryImageTitle: "assets/images/Computer Quiz.png",
                    categoryImageBackground:
                        "assets/images/computer_opacity_background.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 101, 140, 232),
                  ),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/computer science.png",
              title: "Computer Science",
              backgroundColor: const Color.fromARGB(255, 101, 140, 232),
            ),
          ),
          //--------------------------------------- Science -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "23",
                    categoryImageTitle: "assets/images/SainsQuiz.png",
                    categoryImageBackground:
                        "assets/images/Science_Background.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 134, 238, 234),
                  ),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/science.png",
              title: "Science",
              backgroundColor: const Color.fromARGB(255, 134, 238, 234),
            ),
          ),

          //--------------------------------------- Science Gadget-----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "23",
                    categoryImageTitle: "assets/images/Science Gadget Quiz.png",
                    categoryImageBackground:
                        "assets/images/science_gadget_opacity_background.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 194, 117, 242),
                  ),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/science gadget.png",
              title: "Science Gadget",
              backgroundColor: const Color.fromARGB(255, 194, 117, 242),
            ),
          ),
          //--------------------------------------- Math -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "23",
                    categoryImageTitle: "assets/images/Math Quiz.png",
                    categoryImageBackground:
                        "assets/images/math_opacity_background.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 238, 185, 61),
                  ),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/math.png",
              title: "Mathematics",
              backgroundColor: const Color.fromARGB(255, 238, 185, 61),
            ),
          ),
        ],
      ),
    );
  }
}
