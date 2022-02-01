// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameState on _GameState, Store {
  final _$numberOfMovesLeftAtom = Atom(name: '_GameState.numberOfMovesLeft');

  @override
  int get numberOfMovesLeft {
    _$numberOfMovesLeftAtom.reportRead();
    return super.numberOfMovesLeft;
  }

  @override
  set numberOfMovesLeft(int value) {
    _$numberOfMovesLeftAtom.reportWrite(value, super.numberOfMovesLeft, () {
      super.numberOfMovesLeft = value;
    });
  }

  final _$tilesAtom = Atom(name: '_GameState.tiles');

  @override
  ObservableList<Tile> get tiles {
    _$tilesAtom.reportRead();
    return super.tiles;
  }

  @override
  set tiles(ObservableList<Tile> value) {
    _$tilesAtom.reportWrite(value, super.tiles, () {
      super.tiles = value;
    });
  }

  final _$explorerAtom = Atom(name: '_GameState.explorer');

  @override
  Explorer get explorer {
    _$explorerAtom.reportRead();
    return super.explorer;
  }

  @override
  set explorer(Explorer value) {
    _$explorerAtom.reportWrite(value, super.explorer, () {
      super.explorer = value;
    });
  }

  final _$_GameStateActionController = ActionController(name: '_GameState');

  @override
  void handleTileTapped(int value) {
    final _$actionInfo = _$_GameStateActionController.startAction(
        name: '_GameState.handleTileTapped');
    try {
      return super.handleTileTapped(value);
    } finally {
      _$_GameStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleReset() {
    final _$actionInfo = _$_GameStateActionController.startAction(
        name: '_GameState.handleReset');
    try {
      return super.handleReset();
    } finally {
      _$_GameStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleMoveExplorer() {
    final _$actionInfo = _$_GameStateActionController.startAction(
        name: '_GameState.handleMoveExplorer');
    try {
      return super.handleMoveExplorer();
    } finally {
      _$_GameStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numberOfMovesLeft: ${numberOfMovesLeft},
tiles: ${tiles},
explorer: ${explorer}
    ''';
  }
}
