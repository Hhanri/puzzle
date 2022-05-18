import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/pages/game_page.dart';
import 'package:puzzle/pages/win_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<PuzzleBloc>(
          create: (context) => PuzzleBloc()..add(StartGameEvent()),
            child: BlocBuilder<PuzzleBloc, PuzzleState>(
            builder: (BuildContext context, state) {
              if (state is PuzzleGameState) {
                return GameScreen(state: state);
              }
              if (state is PuzzleWinState) {
                return const WinScreen();
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}