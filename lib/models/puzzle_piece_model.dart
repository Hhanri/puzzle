import 'package:equatable/equatable.dart';

class PuzzlePieceModel extends Equatable{
  final String text;
  final int number;

  const PuzzlePieceModel({
    required this.text,
    required this.number
  });

  static List<List<PuzzlePieceModel?>> generateOriginalPuzzle(int length) {
    List<PuzzlePieceModel?> base = generate1DPuzzle(length);
    return generatePuzzle(length, base);
  }

  static List<List<PuzzlePieceModel?>> generateRandomPuzzle(int length) {
    final List<PuzzlePieceModel?> base = generate1DPuzzle(length)..shuffle();
    final List<List<PuzzlePieceModel?>> puzzle = generatePuzzle(length, base);
    return puzzle;
  }

  static List<PuzzlePieceModel?> generate1DPuzzle(int length) {
    List<PuzzlePieceModel?> puzzle = [];
    for (int i = 0; i < length - 1; i++) {
      puzzle.add(PuzzlePieceModel(text: i.toString(), number: i));
    }
    puzzle.add(null);
    return puzzle;
  }

  static List<List<PuzzlePieceModel?>> generatePuzzle(int length, List<PuzzlePieceModel?> base) {
    List<List<PuzzlePieceModel?>> puzzle = [];
    for (int i = 0; i < length ~/ 4; i++) {
      puzzle.add([]);
      for (int j = 0; j < 4; j++) {
        int num = i*4 + j%4;
        if (num < length) {
          puzzle[i].add(
            base[num] != null
              ? PuzzlePieceModel(text: base[num]!.text, number: base[num]!.number)
              : null
          );
        }
      }
    }
    return puzzle;
  }

  @override
  List<Object?> get props => [text, number];
}