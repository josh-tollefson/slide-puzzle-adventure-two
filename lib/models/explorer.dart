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
    this.currentTileValue = 0,
    this.currentPath = 0,
    this.destinationTileValue = 0,
    this.destinationPath = 0,
    this.offBoard = false,
    this.interiorDirection = true,
  });

  /// The value of the [Tile] the explorer is currently on.
  @observable
  int currentTileValue;

  /// The path value of the currentTile the explorer is on.
  @observable
  int currentPath;

  /// The value of the [Tile] the explorer must end on.
  int destinationTileValue;

  /// The path value of the destinationTile the explorer must end on.
  int destinationPath;

  // /// the next path on the current tile following the current path
  // int get nextPath => currentTile.paths[currentPath] ?? currentPath;

  /// Indicates whether the explorer is off the board.
  @observable
  bool offBoard;

  /// Indicates whether the explorer travels towards its tile's interior
  /// and onto the other path, or crosses to its adjacent tile.
  /// true = move forward and follow path on current tile
  /// false = reverse and follow path on neighbor tile
  @observable
  bool interiorDirection;

  /// indicated whether the explorer reached its final destination.
  bool get reachedDestination =>
    (currentTileValue == destinationTileValue) &
    (currentPath == destinationPath);
}
