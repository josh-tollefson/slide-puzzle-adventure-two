import 'package:mobx/mobx.dart';
import 'package:slide_puzzle_adventure/models/explorer.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';
import 'package:slide_puzzle_adventure/models/level.dart';

class LevelLoader {
  Level _levelOne() {

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
      destinationTileValue: 2,
      destinationPath: 4,
      interiorDirection: true,
    );

    return Level(
        value: 1,
        numberOfMovesLeft: 3,
        tiles: tiles,
        explorer: explorer
    );
  }

  Level _levelTwo() {

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
      destinationTileValue: 2,
      destinationPath: 4,
      interiorDirection: false,
    );

    return Level(
        value: 2,
        numberOfMovesLeft: 3,
        tiles: tiles,
        explorer: explorer
    );
  }

  Level _levelThree() {

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

    return Level(
      value: 3,
      numberOfMovesLeft: 3,
      tiles: tiles,
      explorer: explorer
    );
  }

  Level getLevel(int levelNumber) {
    if (levelNumber == 1) {
      return _levelOne();
    }
    if (levelNumber == 2) {
      return _levelTwo();
    }
    if (levelNumber == 3) {
      return _levelThree();
    }

    return _levelOne();
  }
}