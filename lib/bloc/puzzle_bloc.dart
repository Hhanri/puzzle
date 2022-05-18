import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
    PuzzleBloc() : super(PuzzleInitial()) {

    List<List<PuzzlePieceModel?>> puzzle =  PuzzlePieceModel.generateOriginalPuzzle(16);

    final List<List<PuzzlePieceModel?>> originalPuzzle = PuzzlePieceModel.generateOriginalPuzzle(16);
    final int length = puzzle.length;
    final int subLength = puzzle[0].length;

    void shufflePuzzle () {
      puzzle =  PuzzlePieceModel.generateOriginalPuzzle(16);
    }

    on<StartGameEvent>((event, emit) {
      shufflePuzzle();
      emit(PuzzleGameState(length: length, subLength: subLength, puzzle: puzzle));
    });

    void movePiece({required PuzzlePieceModel piece, required int row, required int col}) {
      if (row-1 >= 0 && puzzle[row-1][col] == null) {
        puzzle[row-1][col] = piece;
        puzzle[row][col] = null;
      }
      else if (row+1 < length && puzzle[row+1][col] == null) {
        puzzle[row+1][col] = piece;
        puzzle[row][col] = null;
      }
      else if (col-1 >= 0 && puzzle[row][col-1] == null) {
        puzzle[row][col-1] = piece;
        puzzle[row][col] = null;
      }
      else if (col-1 < subLength && puzzle[row][col+1] == null) {
        puzzle[row][col+1] = piece;
        puzzle[row][col] = null;
      }
    }

    bool comparePuzzles() {
      for (int i = 0; i < length; i++) {
        if (!listEquals(puzzle[i], originalPuzzle[i])) {
          return false;
        }
      }
      return true;
    }

    on<MovePieceEvent>((event, emit) {
      movePiece(piece: event.piece, row: event.row, col: event.col);
      emit(PuzzleGameState(length: length, subLength: subLength, puzzle: puzzle));
      if (comparePuzzles()) {
        emit(PuzzleWinState());
      }
    });
  }
}
