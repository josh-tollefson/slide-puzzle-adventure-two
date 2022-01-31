import 'package:mobx/mobx.dart';
import 'package:slide_puzzle_adventure/models/position.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';

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

  void initializeLevel() {
    tiles.addAll([
      Tile(
        value: 1,
        image: 'assets/images/tiles/tile_1.png',
        startPosition: Position(x: 0, y: 0),
        currentPosition: Position(x: 0, y: 0),
      ),
      Tile(
        value: 2,
        image: 'assets/images/tiles/tile_2.png',
        startPosition: Position(x: 0, y: 0),
        currentPosition: Position(x: 0, y: 0),
      ),
      Tile(
        value: 3,
        image: 'assets/images/tiles/tile_3.png',
        startPosition: Position(x: 0, y: 0),
        currentPosition: Position(x: 0, y: 0),
      ),
      Tile(
        value: 4,
        startPosition: Position(x: 0, y: 0),
        currentPosition: Position(x: 0, y: 0),
        isWhitespace: true,
      ),
    ]
    );
  }

  @action
  void executeTileMove(int value) {
    Tile clickedTile = tiles.singleWhere((tile) => value == tile.value);
    if (!clickedTile.isWhitespace) {
      numberOfMovesLeft--;
    }
  }
}