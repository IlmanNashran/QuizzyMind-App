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
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/general.png",
              title: "General Knowledge",
              backgroundColor: Color.fromARGB(255, 171, 246, 168),
            ),
          ),
          //--------------------------------------- History -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/history.png",
              title: "History",
              backgroundColor: Color.fromARGB(255, 235, 243, 118),
            ),
          ),
          //--------------------------------------- Computer Science -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/computer science.png",
              title: "Computer Science",
              backgroundColor: Color.fromARGB(255, 101, 140, 232),
            ),
          ),
          //--------------------------------------- Science -----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/science.png",
              title: "Science",
              backgroundColor: Color.fromARGB(255, 134, 238, 234),
            ),
          ),

          //--------------------------------------- Science Gadget-----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/science gadget.png",
              title: "Science Gadget",
              backgroundColor: Color.fromARGB(255, 194, 117, 242),
            ),
          ),
          //--------------------------------------- Science Gadget-----------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: CardCategoryDesign(
              key: UniqueKey(),
              image: "assets/images/math.png",
              title: "Mathematics",
              backgroundColor: Color.fromARGB(255, 238, 185, 61),
            ),
          ),
        ],
      ),
    );
  }
}
