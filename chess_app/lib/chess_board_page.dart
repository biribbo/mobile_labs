import 'package:flutter/material.dart';
import 'package:lab_3/chess_item.dart';

class ChessBoardPage extends StatelessWidget {
  const ChessBoardPage({super.key, required this.item});
  final ChessItem item;

  @override
  Widget build(BuildContext context) {
    String lvl = "łatwy";

    if (item.difficultyLevel == DifficultyLevel.medium) {
      lvl = "średni";
    } else if (item.difficultyLevel == DifficultyLevel.hard) {
      lvl = "trudny";
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(children: [
          const SizedBox(height: 20),
          SizedBox(width: 350, height: 350, child: item.board),
          const SizedBox(height: 20),
          item.isDone
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Icon(Icons.check_circle),
                      SizedBox(width: 12),
                      Text("Ukończone")
                    ])
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline),
                    SizedBox(width: 12),
                    Text("Nie ukończone")
                  ],
                ),
          const SizedBox(height: 20),
          Text("Kod FEN: ${item.fen}", textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Text(item.description),
          const SizedBox(height: 20),
          Text("Pozion trudności: $lvl")
        ]),
      ),
    );
  }
}
