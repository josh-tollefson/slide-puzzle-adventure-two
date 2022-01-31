import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/puzzle/puzzle_page.dart';

import 'models/game_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Provider<GameState>(
      create: (context) => GameState(),
      child: MaterialApp(
        title: 'Slide Puzzle App',
        home: PuzzlePage(title: 'Slide Puzzle Adventure'),
      ),
    );
  }
}

