part of 'puzzle_bloc.dart';

@immutable
abstract class PuzzleState{}

class PuzzleInitial extends PuzzleState {
}

class PuzzleGameState extends PuzzleState{
  final int length;
  final int subLength;
  final List<List<PuzzlePieceModel?>> puzzle;

  PuzzleGameState({
    required this.length,
    required this.subLength,
    required this.puzzle
  });
}

class PuzzleWinState extends PuzzleState{
}