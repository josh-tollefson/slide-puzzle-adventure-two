import 'package:flutter/material.dart';
import 'package:slide_puzzle_adventure/components/puzzle_tile.dart';
import 'package:slide_puzzle_adventure/models/position.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';

class PuzzleGrid extends StatelessWidget {
  PuzzleGrid({Key? key}) : super(key: key);

  final List<Widget> tiles = [
    PuzzleTile(
      tile: Tile(
        value: 1,
        image: 'assets/images/tiles/tile_1.png',
        startPosition: Position(x: 0, y: 0),
        currentPosition: Position(x: 0, y: 0),
      )
    ),
    PuzzleTile(
        tile: Tile(
          value: 2,
          image: 'assets/images/tiles/tile_2.png',
          startPosition: Position(x: 0, y: 0),
          currentPosition: Position(x: 0, y: 0),
        )
    ),
    PuzzleTile(
        tile: Tile(
          value: 3,
          image: 'assets/images/tiles/tile_3.png',
          startPosition: Position(x: 0, y: 0),
          currentPosition: Position(x: 0, y: 0),
        )
    ),
    PuzzleTile(
        tile: Tile(
          value: 4,
          startPosition: Position(x: 0, y: 0),
          currentPosition: Position(x: 0, y: 0),
          isWhitespace: true,
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: tiles,
    );
  }
}