import 'package:flutter/material.dart';

class CardAchievementBadge extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;

  const CardAchievementBadge({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2.0, // Adjust the card elevation as needed
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the border radius as needed
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 7.0), // Adjust the margin as needed
              child: Row(
                children: [
                  Container(
                    width: 125,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image!),
                      ),
                    ),
                  ),
                  Container(
                    width: 220.0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 4.0), // Adjust as needed

                      title: Text(
                        title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              18.0, // Adjust the title font size as needed
                        ),
                      ),
                      subtitle: Text(description!),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
