part of 'puzzle_bloc.dart';

@immutable
abstract class PuzzleEvent {}

class MovePieceEvemt {
  final PuzzlePieceModel piece;
  final int row;
  final int col;

  MovePieceEvemt({required this.piece, required this.row, required this.col});
}