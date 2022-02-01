// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explorer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Explorer on _Explorer, Store {
  final _$currentTileAtom = Atom(name: '_Explorer.currentTile');

  @override
  Tile get currentTile {
    _$currentTileAtom.reportRead();
    return super.currentTile;
  }

  @override
  set currentTile(Tile value) {
    _$currentTileAtom.reportWrite(value, super.currentTile, () {
      super.currentTile = value;
    });
  }

  final _$currentPathAtom = Atom(name: '_Explorer.currentPath');

  @override
  int get currentPath {
    _$currentPathAtom.reportRead();
    return super.currentPath;
  }

  @override
  set currentPath(int value) {
    _$currentPathAtom.reportWrite(value, super.currentPath, () {
      super.currentPath = value;
    });
  }

  final _$offBoardAtom = Atom(name: '_Explorer.offBoard');

  @override
  bool get offBoard {
    _$offBoardAtom.reportRead();
    return super.offBoard;
  }

  @override
  set offBoard(bool value) {
    _$offBoardAtom.reportWrite(value, super.offBoard, () {
      super.offBoard = value;
    });
  }

  final _$forwardDirectionAtom = Atom(name: '_Explorer.forwardDirection');

  @override
  bool get forwardDirection {
    _$forwardDirectionAtom.reportRead();
    return super.forwardDirection;
  }

  @override
  set forwardDirection(bool value) {
    _$forwardDirectionAtom.reportWrite(value, super.forwardDirection, () {
      super.forwardDirection = value;
    });
  }

  @override
  String toString() {
    return '''
currentTile: ${currentTile},
currentPath: ${currentPath},
offBoard: ${offBoard},
forwardDirection: ${forwardDirection}
    ''';
  }
}
