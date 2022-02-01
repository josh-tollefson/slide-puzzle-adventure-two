import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';
import 'package:slide_puzzle_adventure/models/explorer.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'game_state.g.dart';

class GameState = _GameState with _$GameState;

abstract class _GameState with Store {
  /// Number of remaining tile swaps allowed
  @observable
  int numberOfMovesLeft = -1;

  @observable
  ObservableList<Tile> tiles = ObservableList();

  @observable
  Explorer explorer = Explorer(
    currentTileValue: 1,
    currentPath: 0,
    destinationTileValue: 1,
    destinationPath: 3,
    forwardDirection: true,
  );

  int get puzzleDimension => sqrt(tiles.length).toInt();

  void initializeLevel() {
    numberOfMovesLeft = 3;
    tiles.addAll(
      [
        Tile(
          value: 1,
          image: 'assets/images/tiles/tile_1.png',
        ),
        Tile(
          value: 2,
          image: 'assets/images/tiles/tile_2.png',
        ),
        Tile(
          value: 3,
          image: 'assets/images/tiles/tile_3.png',
        ),
        Tile(
          value: 4,
          isWhitespace: true,
        ),
      ]
    );
  }

  @action
  void handleTileTapped(int value) {
    _swapTiles(value);
  }

  void _swapTiles(int value) {
    int clickedTileIndex = tiles.indexWhere((tile) => value == tile.value);
    int whiteSpaceTileIndex = tiles.indexWhere((tile) => tile.isWhitespace);

    if (_isNeighbor(clickedTileIndex, whiteSpaceTileIndex)) {
      numberOfMovesLeft--;
      final clickedTile = tiles[clickedTileIndex];
      tiles[clickedTileIndex] = tiles[whiteSpaceTileIndex];
      tiles[whiteSpaceTileIndex] = clickedTile;
    }
  }

  /// returns the row and col from the tile's index in the tiles list
  List<int> _getTileRowCol(int tileIndex) {
    final row = tileIndex ~/ puzzleDimension;
    final col = tileIndex % puzzleDimension;

    return [row, col];
  }

  /// returns true if tile1 and tile2 are orthogonally adjacent
  /// based on the index in the tiles list
  bool _isNeighbor(int tileIndex1, int tileIndex2) {
    final rowCol1 = _getTileRowCol(tileIndex1);
    final rowCol2 = _getTileRowCol(tileIndex2);
    final deltaRow = rowCol1[0] - rowCol2[0];
    final deltaCol = rowCol1[1] - rowCol2[1];

    if ((deltaRow.abs() == 1 && deltaCol.abs() == 0) ||
        (deltaRow.abs() == 0 && deltaCol.abs() == 1)) {
      return true;
    }

    return false;
  }
}