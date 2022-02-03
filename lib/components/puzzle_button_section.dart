import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/models/game_state.dart';
import 'package:slide_puzzle_adventure/models/level.dart';
import 'package:slide_puzzle_adventure/theme/themes.dart';

class PuzzleButtonsSection extends StatelessWidget {
  const PuzzleButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Observer(
      builder: (context) {
        final currentLevel = gameState.level;

        switch (currentLevel.levelStatus) {
          case LevelStatus.incomplete:
            return const _IncompleteLevelButtons();
          case LevelStatus.complete:
            return const _CompletedLevelButtons();
          case LevelStatus.lost:
            return const _LostLevelButtons();
          case LevelStatus.offboard:
            return const _LostLevelButtons();
        }
      }
    );
  }
}

class _PuzzleButton extends StatelessWidget {
  const _PuzzleButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  /// The background color of this button.
  final Color? backgroundColor;

  /// The text color of this button.
  final Color? textColor;

  /// Called when this button is tapped.
  final VoidCallback onPressed;

  /// The label of this button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: textColor,
          backgroundColor: backgroundColor,
          onSurface: backgroundColor,
          // textStyle: PuzzleTextStyle.headline5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class _IncompleteLevelButtons extends StatelessWidget {
  const _IncompleteLevelButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _MoveExplorerButton(),
              _ReverseExplorerButton(),
            ],
          ),
         const  _ResetPuzzleButton(),
        ],
    );
  }
}

class _CompletedLevelButtons extends StatelessWidget {
  const _CompletedLevelButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _NextLevelButton(),
      ],
    );
  }
}

class _LostLevelButtons extends StatelessWidget {
  const _LostLevelButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ResetPuzzleButton(),
      ],
    );
  }
}




class _MoveExplorerButton extends StatelessWidget {
  const _MoveExplorerButton({Key? key}) : super(key: key);

  final theme = const AntiqueMapTheme();

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return _PuzzleButton(
      textColor: theme.textColor,
      backgroundColor: theme.buttonColor,
      onPressed: () => gameState.handleMoveExplorer(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/simple_dash_small.png',
            width: 50,
            height: 50,
          ),
          const Gap(10),
          const Text('Move Dash'),
        ],
      ),
    );
  }
}

class _ReverseExplorerButton extends StatelessWidget {
  const _ReverseExplorerButton({Key? key}) : super(key: key);

  final theme = const AntiqueMapTheme();

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return _PuzzleButton(
      textColor: theme.textColor,
      backgroundColor: theme.buttonColor,
      onPressed: () => gameState.handleReverseExplorer(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/arrow.png',
            width: 50,
            height: 50,
          ),
          const Gap(10),
          const Text('Reverse Dash\'s Direction'),
        ],
      ),
    );

  }
}

class _ResetPuzzleButton extends StatelessWidget {
  const _ResetPuzzleButton({Key? key}) : super(key: key);

  final theme = const AntiqueMapTheme();

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return _PuzzleButton(
      textColor: theme.textColor,
      backgroundColor: theme.buttonColor,
      onPressed: () => gameState.handleReset(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/shuffle_icon.png',
            width: 17,
            height: 17,
          ),
          const Gap(10),
          const Text('Reset Level'),
        ],
      ),
    );
  }
}

class _NextLevelButton extends StatelessWidget {
  const _NextLevelButton({Key? key}) : super(key: key);

  final theme = const AntiqueMapTheme();

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return _PuzzleButton(
      textColor: theme.textColor,
      backgroundColor: theme.buttonColor,
      onPressed: () => gameState.handleNextLevel(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Next Level'),
        ],
      ),
    );
  }
}
