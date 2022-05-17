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
}