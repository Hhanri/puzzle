import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';
import 'package:puzzle/widgets/puzzle_piece_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<PuzzleBloc>(
        create: (context) => PuzzleBloc()..add(StartGameEvent()),
          child: BlocBuilder<PuzzleBloc, PuzzleState>(
          builder: (BuildContext context, state) {
            if (state is PuzzleGameState) {
              List<List<PuzzlePieceModel?>> puzzle = state.puzzle;
              return GridView.builder(
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
              );
            }
            return const CircularProgressIndicator();
          },
        ),
),
      ),
    );
  }
}