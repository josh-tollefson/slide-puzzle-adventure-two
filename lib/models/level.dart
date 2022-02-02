import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'package:slide_puzzle_adventure/models/tile.dart';
import 'package:slide_puzzle_adventure/models/explorer.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'level.g.dart';

enum LevelStatus { incomplete, complete, lost, offboard }

class Level = _Level with _$Level;

abstract class _Level with Store {
  _Level({
    required this.value,
    required this.numberOfMovesLeft,
    required this.tiles,
    required this.explorer,
  });

  /// level number
  int value;

  /// Number of remaining tile swaps allowed
  @observable
  int numberOfMovesLeft;

  /// tiles in level
  @observable
  ObservableList<Tile> tiles;

  /// explorer in level
  @observable
  Explorer explorer;

  /// dimension of the level, e.g. 2x2
  int get puzzleDimension => sqrt(tiles.length).toInt();

  /// solved status of the level
  LevelStatus get levelStatus {
    if (explorer.offBoard) {
      return LevelStatus.offboard;
    }
    else if (explorer.reachedDestination) {
      return LevelStatus.complete;
    }
    else if (numberOfMovesLeft < 0) {
      return LevelStatus.lost;
    }
    else {
      return LevelStatus.incomplete;
    }
  }

  /// Swap the given (clicked) tile with the whitespace tile in tiles list
  void swapTiles(int value) {
    final clickedTileIndex = tiles.indexWhere((tile) => value == tile.value);
    final whiteSpaceTileIndex = tiles.indexWhere((tile) => tile.isWhitespace);

    if (_isNeighbor(clickedTileIndex, whiteSpaceTileIndex)) {
      numberOfMovesLeft--;
      final clickedTile = tiles[clickedTileIndex];
      tiles[clickedTileIndex] = tiles[whiteSpaceTileIndex];
      tiles[whiteSpaceTileIndex] = clickedTile;
    }
  }

  /// Move the explorer until they reach a whitespace tile or fall off the board
  void moveExplorer() {
    while (true) {
      final currentTile = _getTileFromValue(explorer.currentTileValue);
      final currentPath = explorer.currentPath;
      final nextTile = _getNextTile(currentTile, currentPath);

      if (nextTile == null) {
        explorer.offBoard = true;
        break;
      }
      else if (nextTile.isWhitespace) {
        explorer.interiorDirection = true;
        break;
      }
      else {
        _moveExplorerOnce();
        if (explorer.reachedDestination) {
          break;
        }
      }
    }
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
    final nextTile = _getNextTile(currentTile, currentPath);

    if (nextTile != null && !nextTile.isWhitespace) {
      if (explorer.interiorDirection) {
        explorer.currentTileValue = explorer.currentTileValue;
        explorer.currentPath = _getNextPath(currentTile, currentPath);
        explorer.interiorDirection = false;
      }
      else {
        explorer.currentTileValue = nextTile.value;
        explorer.currentPath = oppositePath[currentPath] ?? currentPath;
        explorer.interiorDirection = true;
      }
    }
  }

  Tile _getTileFromValue(int tileValue) {
    final tile = tiles.singleWhere((t) => tileValue == t.value);
    return tile;
  }

  Tile? _getNextTile(Tile tile, int path) {
    final tileIndex = tiles.indexWhere((t) => tile.value == t.value);
    final tileRowCol = _getTileRowCol(tileIndex);

    final row = tileRowCol[0];
    final col = tileRowCol[1];

    if (explorer.interiorDirection) {
      return tile;
    }

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


  /// returns the row and col from the tile's index in the tiles list
  List<int> _getTileRowCol(int tileIndex) {
    final row = tileIndex ~/ puzzleDimension;
    final col = tileIndex % puzzleDimension;

    return [row, col];
  }

  Tile _getTileFromRowCol(int row, int col) {
    final tileIndex = col + puzzleDimension * row;

    return tiles[tileIndex];
  }
}
