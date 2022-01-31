import 'package:mobx/mobx.dart';

// To generate the part file run:
//   flutter pub run build_runner watch --delete-conflicting-outputs
//
// More generally: A run build_runner B --delete-conflicting-outputs
// - Replace A with `flutter pub` (for flutter apps) or `dart` (for pure dart)
// - Replace B with 'build' (forces a one off build) or 'watch' (builds whenever files change)
part 'position.g.dart';

class Position = _Position with _$Position;

abstract class _Position with Store {
  _Position({
    required this.x,
    required this.y,
  });
  /// The x position.
  @observable
  int x = 0;

  /// The y position.
  @observable
  int y = 0;
}


