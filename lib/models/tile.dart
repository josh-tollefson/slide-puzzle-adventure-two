import 'package:mobx/mobx.dart';
import 'package:slide_puzzle_adventure/models/position.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'tile.g.dart';

Map<int,int> oppositePath = {0:5, 1:4, 2:7, 3:6, 4:1, 5:0, 6:3, 7:2};

class Tile = _Tile with _$Tile;

abstract class _Tile with Store {
  _Tile({
    this.value = 0,
    required this.startPosition,
    required this.currentPosition,
    this.paths = const {},
    this.markers = const {},
    this.image = '',
    this.isWhitespace = false,
  });

  /// Value representing the correct position of [Tile] in a list.
  final int value;

  /// The starting 2D [Position] of the [Tile].
  final Position startPosition;

  /// The current 2D [Position] of the [Tile].
  @observable
  Position currentPosition;

  /// Dictionary containing all paths
  /// --- 0 --- 1 ---
  /// |              |
  /// 7              2
  /// |              |
  /// 6              3
  /// |              |
  /// --- 5 --- 4 ---
  /// e.g., {0: 2} means there is path from point 0 to point 2 on the tile
  /// For now, paths are bi-directional
  final Map<int,int> paths;

  /// Dictionary containing marker locations
  /// e.g., {0: 'puzzle_start', 4: 'puzzle_end'}
  final Map<int,String> markers;

  /// name of image
  final String image;

  /// Denotes if the [Tile] is the whitespace tile or not.
  final bool isWhitespace;
}
