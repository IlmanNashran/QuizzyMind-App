import 'package:flutter/material.dart';
import 'package:quizzy_mind/pages/home_page.dart';
import 'package:quizzy_mind/pages/utils/designs/card_achievement_badge.dart';
import 'package:quizzy_mind/pages/utils/designs/card_score.dart';

class GameEndPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  final String score;
  final String maxQuestions;
  final String difficulityLevel;

  GameEndPage(
      {required this.score,
      required this.maxQuestions,
      required this.difficulityLevel});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 155, 182, 205),
              expandedHeight: 399.0, // Initial size of the image
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/trophy.gif",
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                iconSize: 50, // Change to 'Icons.close' for 'x' symbol
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _MyMarkHeader(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _recentScore(),
                const SizedBox(
                  height: 20,
                ),
                _achievementsBadge(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentScore() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Recent Score",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 33, 31, 31),
              ),
            ),
          ),
          CardScore(
              score: score,
              maxQuestions: maxQuestions,
              difficulityLevel: difficulityLevel),
        ],
      ),
    );
  }

  Widget _achievementsBadge() {
    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Achievement Badge",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 33, 31, 31),
              ),
            ),
          ),
          CardAchievementBadge(
            image: 'assets/images/trophy_badge.png',
            title: 'First Win',
            description: 'Win by finish the game.',
            // You can specify a different line color if needed
          ),
          CardAchievementBadge(
            image: 'assets/images/fire_badge.png',
            title: 'On Fire',
            description: 'Finish all Quiz.',
            // You can specify a different line color if needed
          ),
          CardAchievementBadge(
            image: 'assets/images/mantul_badge.png',
            title: 'Cool Guy',
            description: ' Achievement goes to Cool Guy.',
            // You can specify a different line color if needed
          ),
        ],
      ),
    );
  }
}

class _MyMarkHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 100.0; // Minimum height when not expanded

  @override
  double get maxExtent => 100.0; // Maximum height when expanded

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Return the content for the persistent header
    return Container(
      color: Colors.white, // Background color of the header
      alignment: Alignment.center,
      child: const Text(
        "My Score", // Header text or content
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // Return true if the content needs to be rebuilt when parameters change
    return false;
  }
}
