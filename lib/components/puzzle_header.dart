import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/models/game_state.dart';

/// Displays the puzzle name, level, and number of moves remaining
class PuzzleHeader extends StatelessWidget {
  const PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Observer(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Get Dash Home!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Level: 1 | Moves Left: ${gameState.numberOfMovesLeft}',
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
}
