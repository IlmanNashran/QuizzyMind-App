import 'package:flutter/material.dart';

class CardCategoryDesign extends StatelessWidget {
  final String title;
  final String image;
  final Color  backgroundColor;

  const CardCategoryDesign({
    required Key key,
    required this.title,
    required this.image,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 150,
            width: 150,
          ),
           Text(
            title,
            style: TextStyle(
              fontFamily: 'LeagueSpartan',
            ),
          ),
        ],
      ),
    );
  }
}
