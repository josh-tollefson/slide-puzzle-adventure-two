import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/models/game_state.dart';
import 'package:slide_puzzle_adventure/models/level.dart';

/// Displays the puzzle name, level, and number of moves remaining
class PuzzleHeader extends StatelessWidget {
  const PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Observer(
      builder: (context) {
        final currentLevel = gameState.level;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _getDisplayedPuzzleStatus(currentLevel.levelStatus),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Level: 1 | Moves Left: ${max(0,currentLevel.numberOfMovesLeft)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
          ],
        );
      }
    );
  }

  String _getDisplayedPuzzleStatus(LevelStatus puzzleStatus) {
    if (puzzleStatus == LevelStatus.incomplete) {
      return 'Get Dash Home!'; 
    }
    else if (puzzleStatus == LevelStatus.complete) {
      return 'Dash Returned Home!';
    }
    else if (puzzleStatus == LevelStatus.lost) {
      return 'Too many moves! Try again.';
    }
    else if (puzzleStatus == LevelStatus.offboard) {
      return 'Dash fell off the world! Try again.';
    }
    else {
      return '';
    }
  }
}
