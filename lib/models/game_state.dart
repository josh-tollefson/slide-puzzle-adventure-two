import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';
import 'package:slide_puzzle_adventure/models/explorer.dart';
import 'package:slide_puzzle_adventure/models/level.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'game_state.g.dart';

class GameState = _GameState with _$GameState;

abstract class _GameState with Store {
  @observable
  Level level = Level();

  void initializeLevel() {

    ObservableList<Tile> tiles = ObservableList();
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

    Explorer explorer = Explorer(
      currentTileValue: 1,
      currentPath: 7,
      destinationTileValue: 3,
      destinationPath: 2,
      interiorDirection: true,
    );

    level.value = 1;
    level.numberOfMovesLeft = 3;
    level.tiles = tiles;
    level.explorer = explorer;
  }

  @action
  void handleTileTapped(int value) {
    if ((level.numberOfMovesLeft >= 0) &&
        (level.levelStatus == LevelStatus.incomplete)) {
      level.swapTiles(value);
    }
  }

  @action
  void handleReset() {
    initializeLevel();
  }

  @action
  void handleMoveExplorer() {
    level.moveExplorer();
  }

  @action
  void handleReverseExplorer() {
    level.explorer.interiorDirection = !level.explorer.interiorDirection;
  }

}