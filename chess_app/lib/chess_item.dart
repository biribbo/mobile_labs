import 'package:lab_3/my_chessboard.dart';

enum DifficultyLevel { easy, medium, hard }

class ChessItem {
  ChessItem(
      {required this.fen,
      required this.description,
      required this.difficultyLevel,
      required this.isDone})
      : board = MyChessBoard(fen: fen);

  final String fen;
  final String description;
  final DifficultyLevel difficultyLevel;
  bool isDone;

  late final MyChessBoard board;
}
