import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/widgets/game_board_widget.dart';
import 'package:puzzle/widgets/replay_button_widget.dart';

class GameScreen extends StatelessWidget {
  final PuzzleGameState state;
  const GameScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int gameFlex = ((800/width)*10).ceil();
    int spacerFlex = ((width - gameFlex)/width)*10~/2;
    if (width < 800) {
      return GameBoardScreen(state: state);
    } else {
      return Row(
        children: [
          Spacer(flex: spacerFlex),
          Expanded(
            flex: gameFlex,
            child: GameBoardScreen(state: state)
          ),
          Spacer(flex: spacerFlex),
        ],
      );
    }
  }
}

class GameBoardScreen extends StatelessWidget {
  final PuzzleGameState state;
  const GameBoardScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 6,
          child: GameBoardWidget(
            state: state,
            puzzle: state.puzzle,
          ),
        ),
        const Expanded(child: ReplayButtonWidget())
      ],
    );
  }
}
