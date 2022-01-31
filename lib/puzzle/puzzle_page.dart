import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slide_puzzle_adventure/components/puzzle_header.dart';
import 'package:slide_puzzle_adventure/components/puzzle_grid.dart';
import 'package:slide_puzzle_adventure/components/puzzle_button_section.dart';
import 'package:slide_puzzle_adventure/theme/themes.dart';


class PuzzlePage extends StatelessWidget {
  PuzzlePage({Key? key, required this.title}) : super(key: key);

  final theme = const AntiqueMapTheme();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.defaultColor,
      ),
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PuzzleHeader(),
            Gap(50),
            SizedBox.square(
              dimension: 500,
              child: PuzzleGrid(),
            ),
            Gap(30),
            PuzzleButtonsSection(),
          ],
        ),
      ),
    );
  }

}


