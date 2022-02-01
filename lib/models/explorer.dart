import 'package:mobx/mobx.dart';

import 'package:slide_puzzle_adventure/models/tile.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'explorer.g.dart';

class Explorer = _Explorer with _$Explorer;

abstract class _Explorer with Store {
  _Explorer({
    required this.currentTileValue,
    required this.currentPath,
    required this.destinationTileValue,
    required this.destinationPath,
    this.offBoard = false,
    required this.forwardDirection,
  });

  /// The value of the [Tile] the explorer is currently on.
  @observable
  int currentTileValue;

  /// The path value of the currentTile the explorer is on.
  @observable
  int currentPath;

  /// The value of the [Tile] the explorer must end on.
  final int destinationTileValue;

  /// The path value of the destinationTile the explorer must end on.
  final int destinationPath;

  // /// the next path on the current tile following the current path
  // int get nextPath => currentTile.paths[currentPath] ?? currentPath;

  /// Indicates whether the explorer is off the board.
  @observable
  bool offBoard;

  /// Indicates the direction of the explorer.
  /// true = move forward and follow path on current tile
  /// false = reverse and follow path on neighbor tile
  @observable
  bool forwardDirection;

  /// indicated whether the explorer reached its final destination.
  bool get reachedDestination =>
    (currentTileValue == destinationTileValue) &
    (currentPath == destinationPath);
}
