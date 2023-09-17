import 'package:flutter/material.dart';
import 'package:quizzy_mind/pages/utils/designs/card_achievement_badge.dart';

import 'package:quizzy_mind/pages/utils/designs/table_design.dart';

class GameEndPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

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
                // Your content here, including the _myMark() widget
                _myMark(),

                // Add other widgets as needed
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myMark() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TableDesign(
              leftColumn1: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/trophy_badge.png"),
                  ),
                ),
              ),
              rightColumn1: const Text(
                'Right Column 1',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.0),
              ),
              leftColumn2: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/fire_badge.png"),
                  ),
                ),
              ),
              rightColumn2: const Text(
                'Right Column 2',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.0),
              ),
              leftColumn3: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mantul_badge.png"),
                  ),
                ),
              ),
              rightColumn3: const Text(
                'Right Column 3',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      // Add more CardCategoryDesign widgets as needed
    );
  }

  Widget _achievementsBadge() {
    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Achievement Badge",
            style: TextStyle(
              color: Color.fromARGB(255, 33, 31, 31),
            ),
          ),
          CardAchievementBadge(
            image: 'assets/images/trophy_badge.png',
            title: 'Achievement Title',
            description: 'Description of the achievement goes here.',
            lineColor: Color.fromARGB(255, 33, 31,
                31), // You can specify a different line color if needed
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
      child: Text(
        "My Mark", // Header text or content
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
