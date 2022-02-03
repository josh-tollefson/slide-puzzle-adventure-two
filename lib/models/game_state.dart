import 'package:mobx/mobx.dart';
import 'package:slide_puzzle_adventure/models/explorer.dart';
import 'package:slide_puzzle_adventure/models/level.dart';
import 'package:slide_puzzle_adventure/services/level_loader.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'game_state.g.dart';

class GameState = _GameState with _$GameState;

abstract class _GameState with Store {

  LevelLoader levelLoader = LevelLoader();

  @observable
  Level level = Level(
    value: -1,
    numberOfMovesLeft: -1,
    tiles: ObservableList(),
    explorer: Explorer(),
  );

  @observable
  int levelNumber = 1;

  void initializeLevel() {
    level = levelLoader.getLevel(levelNumber);
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

  @action
  void handleNextLevel() {
    levelNumber++;
    initializeLevel();
  }


}