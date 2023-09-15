import 'package:flutter/material.dart';
import 'package:quizzy_mind/pages/game_page.dart';
import 'package:quizzy_mind/pages/category_page.dart';
import 'package:quizzy_mind/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzy Mind',
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}