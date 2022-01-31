import 'package:flutter/material.dart';
import 'package:slide_puzzle_adventure/puzzle/puzzle_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Slide Puzzle App',
      home: PuzzlePage(title: 'Slide Puzzle Adventure'),
    );
  }
}

