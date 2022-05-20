import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';
import 'package:puzzle/widgets/puzzle_piece_widget.dart';

class GameBoardWidget extends StatelessWidget {
  final List<List<PuzzlePieceModel?>> puzzle;
  final PuzzleGameState state;
  const GameBoardWidget({
    Key? key,
    required this.puzzle,
    required this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemCount: state.length * state.subLength,
        itemBuilder: (BuildContext context, int index) {
          final int row = index ~/ state.length;
          final int col = index % state.subLength;
          if (puzzle[row][col] != null) {
            return PuzzlePieceWidget(
              puzzlePiece: puzzle[row][col]!,
              onTap: () {
                BlocProvider.of<PuzzleBloc>(context).add(MovePieceEvent(piece: puzzle[row][col]!, row: row, col: col));
              }
            );
          }
          return Container();
        },
      ),
    );
  }
}
