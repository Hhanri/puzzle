import 'package:equatable/equatable.dart';

class PuzzlePieceModel extends Equatable{
  final String text;
  final int number;

  const PuzzlePieceModel({
    required this.text,
    required this.number
  });

  @override
  List<Object?> get props => [text, number];

  static List<List<PuzzlePieceModel?>> generateOriginalPuzzle(int length) {
    List<List<PuzzlePieceModel?>> puzzle = [];
    for (int i = 0; i <= length ~/ 4; i++) {
      puzzle.add([]);
      for (int j = 0; j < 4; j++) {
        int num = i*4 + j%4;
        if (num == length) {
          puzzle[i].add(null);
        } else {
          puzzle[i].add(PuzzlePieceModel(text: num.toString(), number: num));
        }
      }
    }
    return puzzle;
  }

  static List<List<PuzzlePieceModel?>> generateRandomPuzzle(int length) {
    List<List<PuzzlePieceModel?>> puzzle = generateOriginalPuzzle(length);
    for (int i = 0; i < puzzle.length; i++) {
      puzzle[i].shuffle();
    }
    puzzle.shuffle();
    return puzzle;
  }
}