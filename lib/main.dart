import 'package:flutter/material.dart';
import 'package:slide_puzzle_adventure/puzzle/puzzle.dart';
import 'package:slide_puzzle_adventure/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Slide Puzzle App',
      home: MyHomePage(title: 'Slide Puzzle Adventure'),
    );
  }
}

