import 'package:flutter/material.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';
import 'package:puzzle/widgets/puzzle_piece_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final piece = PuzzlePieceModel(text: "text", number: 2);
    return Scaffold(
      body: Center(
        child: PuzzlePieceWidget(
          puzzlePiece: piece,
          onTap: () {
          }
        ),
      ),
    );
  }
}
