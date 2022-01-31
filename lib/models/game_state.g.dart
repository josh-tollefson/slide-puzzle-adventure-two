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

  @override
  String toString() {
    return '''
numberOfMovesLeft: ${numberOfMovesLeft}
    ''';
  }
}
