import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slide_puzzle_adventure/components/puzzle_header.dart';
import 'package:slide_puzzle_adventure/components/puzzle_grid.dart';
import 'package:slide_puzzle_adventure/components/puzzle_buttons.dart';
import 'package:slide_puzzle_adventure/theme/themes.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
          children: const [
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


