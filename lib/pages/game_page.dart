import 'package:flutter/material.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';
import 'package:puzzle/widgets/puzzle_piece_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  List<List<PuzzlePieceModel?>> puzzle = [
    [PuzzlePieceModel(text: "1", number: 1), PuzzlePieceModel(text: "2", number: 2)],
    [PuzzlePieceModel(text: "3", number: 3), null]
  ];

  @override
  Widget build(BuildContext context) {

    final int length = puzzle.length;
    final int subLength = puzzle[0].length;

    void movePiece({required PuzzlePieceModel piece, required int row, required int col}) {
      if (row-1 >= 0 && puzzle[row-1][col] == null) {
        puzzle[row-1][col] = puzzle[row][col];
        puzzle[row][col] = null;
      }
      else if (row+1 < length && puzzle[row+1][col] == null) {
        puzzle[row+1][col] = puzzle[row][col];
        puzzle[row][col] = null;
      }
      else if (col-1 >= 0 && puzzle[row][col-1] == null) {
        puzzle[row][col-1] = puzzle[row][col];
        puzzle[row][col] = null;
      }
      else if (col-1 < subLength && puzzle[row][col+1] == null) {
        puzzle[row][col+1] = puzzle[row][col];
        puzzle[row][col] = null;
      }
      print(puzzle);
    }

    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: length*subLength,
          itemBuilder: (BuildContext context, int index) {
            final int row = index ~/ length;
            final int col = index % puzzle[row].length;
            if (puzzle[row][col] != null) {
              return PuzzlePieceWidget(
                puzzlePiece: puzzle[row][col]!,
                onTap: () {
                  print("row = $row | col = $col");
                  setState((){
                    movePiece(piece: puzzle[row][col]!, row: row, col: col);
                  });
                }
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
