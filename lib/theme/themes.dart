import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:slide_puzzle_adventure/colors/colors.dart';


/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class AntiqueMapTheme {
  /// {@macro simple_theme}
  const AntiqueMapTheme() : super();

  String get name => 'Antique Map';

  bool get hasTimer => false;

  bool get hasCountdown => false;

  Color get backgroundColor => ThemeColors.primary1;

  Color get defaultColor => ThemeColors.primary2;

  Color get hoverColor => ThemeColors.primary4;

  Color get buttonColor => ThemeColors.primary4;

  Color get pressedColor => ThemeColors.primary5;

  Color get textColor => ThemeColors.white;

  List<Object?> get props => [
    name,
    hasTimer,
    hasCountdown,
    backgroundColor,
    defaultColor,
    hoverColor,
    pressedColor,
  ];
}
