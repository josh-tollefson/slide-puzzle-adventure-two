import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_adventure/models/game_state.dart';
import 'package:slide_puzzle_adventure/models/tile.dart';

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

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return MouseRegion(
        onEnter: (PointerEvent details) => setState(() => isHovering = true),
        onExit: (PointerEvent details) => setState(() => isHovering = false),
        child: GestureDetector(
          onTap: () => gameState.executeTileMove(widget.tile.value),
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
}

