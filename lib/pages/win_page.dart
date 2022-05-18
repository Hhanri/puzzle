import 'package:flutter/material.dart';
import 'package:puzzle/widgets/replay_button_widget.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Expanded(child: Center(child: Text("CONGRATS!"))),
        Expanded(child: Center(child: ReplayButtonWidget()))
      ],
    );
  }
}
