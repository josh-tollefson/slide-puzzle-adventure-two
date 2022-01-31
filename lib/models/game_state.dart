import 'package:mobx/mobx.dart';

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

  @action
  void executeTileMove() {
    numberOfMovesLeft--;
  }
}