import 'package:flutter/material.dart';

class CardAchievementBadge extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? lineColor;
  final String? image;

  const CardAchievementBadge({
    required this.title,
    required this.description,
    required this.image,
    this.lineColor = const Color.fromARGB(255, 66, 64, 64),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0, // Adjust the card elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the border radius as needed
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image!),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0, // Adjust the title font size as needed
                  ),
                ),
                subtitle: Text(description!),
              ),
            ],
          ),
          Divider(
            height: 1.0, // Adjust the divider height as needed
            color: lineColor, // Set the color of the horizontal line
          ),
          ListTile(
            title: Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // Adjust the title font size as needed
              ),
            ),
            subtitle: Text(description!),
          ),

          // Add any additional content or widgets here
        ],
      ),
    );
  }
}
