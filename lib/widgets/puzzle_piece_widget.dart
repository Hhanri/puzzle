import 'package:flutter/material.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';

class PuzzlePieceWidget extends StatelessWidget {
  final VoidCallback onTap;
  final PuzzlePieceModel puzzlePiece;
  const PuzzlePieceWidget({
    Key? key,
    required this.puzzlePiece,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.all(30);
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        enableFeedback: false,
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 3),
                spreadRadius: 3,
                color: Colors.black54,
                blurRadius: 5
              ),
              BoxShadow(
                offset: Offset(-3, -3),
                spreadRadius: 3,
                color: Colors.white,
                blurRadius: 5
              )
            ]
          ),
          child: Center(
            child: Text(
              puzzlePiece.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
          ),
        ),
      ),
    );
  }
}
