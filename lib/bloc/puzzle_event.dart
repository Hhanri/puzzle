part of 'puzzle_bloc.dart';

@immutable
abstract class PuzzleEvent {}

class StartGameEvent extends PuzzleEvent {}

class MovePieceEvent extends PuzzleEvent {
  final PuzzlePieceModel piece;
  final int row;
  final int col;

  MovePieceEvent({required this.piece, required this.row, required this.col});
}