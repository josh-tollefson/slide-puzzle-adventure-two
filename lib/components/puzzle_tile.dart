import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/models/game_state.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';
import 'package:slide_puzzle_adventure/models/explorer.dart';

class PuzzleTile extends StatefulWidget {
  /// {@macro simple_puzzle_tile}
  const PuzzleTile({
    Key? key,
    required this.tile,
  }) : super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  @override
  State<PuzzleTile> createState() => _PuzzleTile();
}

class _PuzzleTile extends State<PuzzleTile> {

  bool isHovering = false;

  Alignment _explorerAlignment(int path) {
    switch (path) {
      case 0:
        return const Alignment(-0.5, -1.1);
      case 1:
        return const Alignment(0.5, -1.1);
      case 2:
        return const Alignment(1.1, -0.5);
      case 3:
        return const Alignment(1.1, 0.5);
      case 4:
        return const Alignment(0.5, 1.1);
      case 5:
        return const Alignment(-0.5, 1.1);
      case 6:
        return const Alignment(-1.1, 0.5);
      case 7:
        return const Alignment(-1.1, -0.5);
      default:
        return const Alignment(0, 0);
    }
  }

  Alignment _arrowAlignment(int path) {
    switch (path) {
      case 0:
        return const Alignment(-0.5, -0.5);
      case 1:
        return const Alignment(0.5, -0.5);
      case 2:
        return const Alignment(0.5, -0.5);
      case 3:
        return const Alignment(0.5, 0.5);
      case 4:
        return const Alignment(0.5, 0.5);
      case 5:
        return const Alignment(-0.5, 0.5);
      case 6:
        return const Alignment(-0.5, 0.5);
      case 7:
        return const Alignment(-0.5, -0.5);
      default:
        return const Alignment(0, 0);
    }
  }

  double _arrowRotation(Explorer explorer)  {
    /// direction the explorer is facing
    final directionality = explorer.interiorDirection ? 1 : -1;

    switch (explorer.currentPath) {
      case 0:
        return pi / 180 * 90 * directionality;
      case 1:
        return pi / 180 * 90 * directionality;
      case 2:
        return pi / 180 * (90 + 90 * directionality);
      case 3:
        return pi / 180 * (90 + 90 * directionality);
      case 4:
        return pi / 180 * -90 * directionality;
      case 5:
        return pi / 180 * -90 * directionality;
      case 6:
        return pi / 180 * (90 - 90 * directionality);
      case 7:
        return pi / 180 * (90 - 90 * directionality);
      default:
        return 0;
    }
  }

  Widget _showDash(Explorer explorer) {
    return Container(
      alignment: _explorerAlignment(explorer.currentPath),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Image.asset(
          '../assets/images/simple_dash_small.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _showDestination(Explorer explorer) {
    return Container(
      alignment: _explorerAlignment(explorer.destinationPath),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Image.asset(
          '../assets/images/trees_1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget _showArrow(Explorer explorer) {
    return Container(
        alignment: _arrowAlignment(explorer.currentPath),
        child: Transform.rotate(
          angle: _arrowRotation(explorer),
          child: SizedBox(
            width: 60,
            height: 50,
            child: Image.asset(
              '../assets/images/arrow.png',
              fit: BoxFit.cover,
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Observer(
      builder: (context) {
        final currentLevel = gameState.level;

        return MouseRegion(
            onEnter: (PointerEvent details) => setState(() => isHovering = true),
            onExit: (PointerEvent details) => setState(() => isHovering = false),
            child: GestureDetector(
              onTap: () => gameState.handleTileTapped(widget.tile.value),
              child: Stack(children: [
                // TODO: We shouldn't need to specify SizedBox, layout is a bit janky right now.
                if (!widget.tile.isWhitespace)
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      widget.tile.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (currentLevel.explorer.destinationTileValue == widget.tile.value)
                  _showDestination(currentLevel.explorer),
                if (currentLevel.explorer.currentTileValue == widget.tile.value)
                  _showDash(currentLevel.explorer),
                if (currentLevel.explorer.currentTileValue == widget.tile.value)
                  _showArrow(currentLevel.explorer),
                if (isHovering)
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                  ),
              ],
              ),
            ),
        );
      }
    );
  }
}

