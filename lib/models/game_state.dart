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
    explorer = Explorer(
      currentTileValue: 1,
      currentPath: 0,
      destinationTileValue: 1,
      destinationPath: 3,
      forwardDirection: true,
    );
    tiles = ObservableList();
    tiles.addAll(
      [
        Tile(
          value: 1,
          image: 'assets/images/tiles/tile_1.png',
          paths: {0:1,1:0,2:7,3:6,4:5,5:4,6:3,7:2},
        ),
        Tile(
          value: 2,
          image: 'assets/images/tiles/tile_2.png',
          paths: {0:3,1:2,2:1,3:0,4:7,5:6,6:5,7:4},
        ),
        Tile(
          value: 3,
          image: 'assets/images/tiles/tile_3.png',
          paths: {0:5,1:7,2:6,3:4,4:3,5:0,6:2,7:1},
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

  @action
  void handleReset() {
    initializeLevel();
  }

  @action
  void handleMoveExplorer() {
    _moveExplorerOnce();
  }

  /// Swap the given (clicked) tile with the whitespace tile in tiles list
  void _swapTiles(int value) {
    final clickedTileIndex = tiles.indexWhere((tile) => value == tile.value);
    final whiteSpaceTileIndex = tiles.indexWhere((tile) => tile.isWhitespace);

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

  Tile _getTileFromRowCol(int row, int col) {
    final tileIndex = col + ( puzzleDimension - 1 ) * row;

    return tiles[tileIndex];
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

  void _moveExplorerOnce() {

    final currentTile = _getTileFromValue(explorer.currentTileValue);
    final currentPath = explorer.currentPath;
    print(explorer.currentTileValue);
    print(currentTile);

    if (explorer.forwardDirection) {
      explorer.currentTileValue = explorer.currentTileValue;
      explorer.currentPath = _getNextPath(currentTile, currentPath);
      print(explorer);
    }

    else {
      final nextTile = _getNextTile(currentTile, currentPath);
      if (nextTile == null) {
        explorer.offBoard = true;
      }
      else if (nextTile.isWhitespace) {
        explorer.forwardDirection = true;
      }
      else {
        explorer.currentTileValue = nextTile.value;
        explorer.currentPath = oppositePath[currentPath] ?? currentPath;
        explorer.forwardDirection = true;
      }
    }

  }

  Tile _getTileFromValue(int tileValue) {
    print('Tile Value: $tileValue');
    print(tiles);
    final tile = tiles.singleWhere((t) => tileValue == t.value);
    return tile;
  }

  Tile? _getNextTile(Tile tile, int path) {
    final tileIndex = tiles.indexWhere((t) => tile.value == t.value);
    final tileRowCol = _getTileRowCol(tileIndex);
    final row = tileRowCol[0];
    final col = tileRowCol[1];

    if ({0,1}.contains(path)) {
      return tileRowCol[0] == 0 ? null : _getTileFromRowCol(row - 1, col);
    }
    else if ({2,3}.contains(path)) {
      return tileRowCol[1] == puzzleDimension - 1 ? null : _getTileFromRowCol(row, col + 1);
    }
    else if ({4,5}.contains(path)) {
      return tileRowCol[0] == puzzleDimension - 1 ? null : _getTileFromRowCol(row + 1, col);
    }
    else if ({6,7}.contains(path)) {
      return tileRowCol[1] == 0 ? null : _getTileFromRowCol(row, col - 1);
    }
    else {
      return null;
    }
  }

  int _getNextPath(Tile tile, int path) {
    return tile.paths[path] ?? path;
  }
}