import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:puzzle/models/puzzle_piece_model.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  final List<List<PuzzlePieceModel?>> originalPuzzle = [

  ];
  PuzzleBloc() : super(PuzzleInitial()) {
    on<PuzzleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
