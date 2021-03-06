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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double spacing = 10;
    return Container(
      constraints: BoxConstraints(
        minHeight: height * (3/4),
        maxWidth: double.infinity
      ),
      color: Colors.black12,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        itemCount: state.length * state.subLength,
        itemBuilder: (BuildContext context, int index) {
          final int row = index ~/ state.length;
          final int col = index % state.subLength;
          if (puzzle[row][col] != null) {
            return PuzzlePieceWidget(
              size: 50,
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
