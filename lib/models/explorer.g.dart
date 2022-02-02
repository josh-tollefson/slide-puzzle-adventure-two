// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explorer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Explorer on _Explorer, Store {
  final _$currentTileValueAtom = Atom(name: '_Explorer.currentTileValue');

  @override
  int get currentTileValue {
    _$currentTileValueAtom.reportRead();
    return super.currentTileValue;
  }

  @override
  set currentTileValue(int value) {
    _$currentTileValueAtom.reportWrite(value, super.currentTileValue, () {
      super.currentTileValue = value;
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

  final _$interiorDirectionAtom = Atom(name: '_Explorer.interiorDirection');

  @override
  bool get interiorDirection {
    _$interiorDirectionAtom.reportRead();
    return super.interiorDirection;
  }

  @override
  set interiorDirection(bool value) {
    _$interiorDirectionAtom.reportWrite(value, super.interiorDirection, () {
      super.interiorDirection = value;
    });
  }

  @override
  String toString() {
    return '''
currentTileValue: ${currentTileValue},
currentPath: ${currentPath},
offBoard: ${offBoard},
interiorDirection: ${interiorDirection}
    ''';
  }
}
