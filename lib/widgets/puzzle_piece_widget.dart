import 'package:flutter/material.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';

class PuzzlePieceWidget extends StatelessWidget {
  final PuzzlePieceModel puzzlePiece;
  const PuzzlePieceWidget({
    Key? key, required this.puzzlePiece
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            spreadRadius: 3,
            color: Colors.black54,
            blurRadius: 5
          )
        ]
      ),
      child: Center(
        child: Text(
          puzzlePiece.text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
