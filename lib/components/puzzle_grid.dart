import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/components/puzzle_tile.dart';
import 'package:slide_puzzle_adventure/models/game_state.dart';

class PuzzleGrid extends StatelessObserverWidget {
  PuzzleGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: gameState.level.tiles.map((t) => PuzzleTile(tile: t)).toList(),
    );
  }
}