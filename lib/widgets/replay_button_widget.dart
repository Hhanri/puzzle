import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';

class ReplayButtonWidget extends StatelessWidget {
  const ReplayButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<PuzzleBloc>(context).add(StartGameEvent());
      },
      child: const Text("PLAY")
    );
  }
}
