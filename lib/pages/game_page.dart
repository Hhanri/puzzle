import 'package:flutter/material.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/widgets/game_board_widget.dart';
import 'package:puzzle/widgets/replay_button_widget.dart';

class GameScreen extends StatelessWidget {
  final PuzzleGameState state;
  const GameScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: GameBoardWidget(
            state: state,
            puzzle: state.puzzle,
          ),
        ),
        const Center(child: ReplayButtonWidget())
      ],
    );
  }
}
