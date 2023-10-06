import 'package:flutter/material.dart';
import 'package:quizzy_mind/pages/utils/designs/fancy_buton_withimage.dart';
import '../pages/utils/animation/polar_bear_animation.dart';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  ScrollController _scrollController = ScrollController();

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
              color: Color.fromRGBO(200, 205, 208, 1),
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
        controller: _scrollController,
        crossAxisCount: 2,
        childAspectRatio: .85,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          //----------------------------------------General Knowledge------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "9",
                    categoryImageTitle: "assets/images/General Quiz.png",
                    categoryImageBackground:
                        "assets/images/General Knowledge.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 74, 174, 183),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/General Knowledge.png'),
            size: 25,
            color: Color.fromARGB(255, 74, 174, 183),
            child: const Text(
              "General Knowledge",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------History------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "9",
                    categoryImageTitle: "assets/images/History Quiz.png",
                    categoryImageBackground: "assets/images/History.png",
                    categoryBackgroundColor: Color.fromARGB(255, 168, 154, 94),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/History.png'),
            size: 25,
            color: Color.fromARGB(255, 168, 154, 94),
            child: Text(
              "History",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Animals------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "27",
                    categoryImageTitle: "assets/images/Animal Quiz.png",
                    categoryImageBackground: "assets/images/Animals.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 64, 83, 162),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Animals.png'),
            size: 25,
            color: Color.fromARGB(255, 64, 83, 162),
            child: Text(
              "Animals",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Mythology------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "20",
                    categoryImageTitle: "assets/images/Myth.png",
                    categoryImageBackground: "assets/images/Mythology.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 217, 207, 183),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Mythology.png'),
            size: 25,
            color: Color.fromARGB(255, 217, 207, 183),
            child: Text(
              "Mythology",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Music------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "12",
                    categoryImageTitle: "assets/images/Music Quiz.png",
                    categoryImageBackground: "assets/images/Music.png",
                    categoryBackgroundColor: const Color(0xFFF5A9AC),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Music.png'),
            size: 25,
            color: Color(0xFFF5A9AC),
            child: Text(
              "Music",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Science------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "17",
                    categoryImageTitle: "assets/images/sains.png",
                    categoryImageBackground:
                        "assets/images/Science & Nature.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 164, 185, 224),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Science & Nature.png'),
            size: 25,
            color: Color.fromARGB(255, 164, 185, 224),
            child: Text(
              "Science",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Geography------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "22",
                    categoryImageTitle: "assets/images/Geo.png",
                    categoryImageBackground: "assets/images/Geography.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 154, 212, 164),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Geography.png'),
            size: 25,
            color: Color.fromARGB(255, 154, 212, 164),
            child: Text(
              "Geography",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Board Games------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "16",
                    categoryImageTitle: "assets/images/Board Game Quiz.png",
                    categoryImageBackground: "assets/images/Board Games.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 225, 200, 164),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Board Games.png'),
            size: 25,
            color: Color.fromARGB(255, 225, 200, 164),
            child: Text(
              "Board Games",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Celebrities------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "26",
                    categoryImageTitle: "assets/images/Celebrities Quiz.png",
                    categoryImageBackground: "assets/images/Celebrities.png",
                    categoryBackgroundColor: const Color(0xFFAF7794),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Celebrities.png'),
            size: 25,
            color: Color(0xFFAF7794),
            child: Text(
              "Celebrities",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //----------------------------------------Sports------------------------------
          FancyButtonWithImage(
            key: UniqueKey(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: "21",
                    categoryImageTitle: "assets/images/Sports Quiz.png",
                    categoryImageBackground: "assets/images/Sports.png",
                    categoryBackgroundColor:
                        const Color.fromARGB(255, 164, 217, 224),
                  ),
                ),
              );
            },
            image: Image.asset('assets/images/Sports.png'),
            size: 25,
            color: Color.fromARGB(255, 164, 217, 224),
            child: Text(
              "Sports",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
