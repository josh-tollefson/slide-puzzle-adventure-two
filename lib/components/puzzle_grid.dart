import 'package:flutter/material.dart';
import 'package:slide_puzzle_adventure/components/puzzle_tile.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';

class PuzzleGrid extends StatelessWidget {
  const PuzzleGrid({Key? key}) : super(key: key);

  final List<Widget> tiles = const [
    PuzzleTile(
      tile: Tile(
        value: 1,
        image: 'assets/images/tiles/tile_1.png',
      )
    ),
    PuzzleTile(
        tile: Tile(
          value: 2,
          image: 'assets/images/tiles/tile_2.png',
        )
    ),
    PuzzleTile(
        tile: Tile(
          value: 3,
          image: 'assets/images/tiles/tile_3.png',
        )
    ),
    PuzzleTile(
        tile: Tile(
          value: 4,
          isWhitespace: true
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