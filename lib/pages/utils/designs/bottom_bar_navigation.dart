import "package:curved_navigation_bar/curved_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:quizzy_mind/pages/home_page.dart";

class BottomBarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: CurvedNavigationBar(
          height: 55,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          color: Color.fromRGBO(200, 205, 208, 1),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          items: [
            Icon(Icons.home),
            Icon(Icons.face),
            Icon(Icons.settings),
          ]),
    );
  }
}
