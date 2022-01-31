import 'package:flutter/material.dart';

/// Displays the puzzle name, level, and number of moves remaining
class PuzzleHeader extends StatelessWidget {
  const PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Get Dash Home!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          'Level: 1 | Moves Left: 3',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
