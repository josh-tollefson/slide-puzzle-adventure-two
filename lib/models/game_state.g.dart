// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameState on _GameState, Store {
  final _$levelAtom = Atom(name: '_GameState.level');

  @override
  Level get level {
    _$levelAtom.reportRead();
    return super.level;
  }

  @override
  set level(Level value) {
    _$levelAtom.reportWrite(value, super.level, () {
      super.level = value;
    });
  }

  final _$levelNumberAtom = Atom(name: '_GameState.levelNumber');

  @override
  int get levelNumber {
    _$levelNumberAtom.reportRead();
    return super.levelNumber;
  }

  @override
  set levelNumber(int value) {
    _$levelNumberAtom.reportWrite(value, super.levelNumber, () {
      super.levelNumber = value;
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
  void handleReverseExplorer() {
    final _$actionInfo = _$_GameStateActionController.startAction(
        name: '_GameState.handleReverseExplorer');
    try {
      return super.handleReverseExplorer();
    } finally {
      _$_GameStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
level: ${level},
levelNumber: ${levelNumber}
    ''';
  }
}
