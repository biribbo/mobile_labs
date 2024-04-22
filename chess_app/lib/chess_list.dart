import 'package:flutter/material.dart';
import 'package:lab_3/checkable_todo_tem.dart';
import 'package:lab_3/chess_board_page.dart';
import 'package:lab_3/chess_item.dart';
import 'package:lab_3/my_chess_items.dart';
import 'package:logging/logging.dart';

class ChessList extends StatefulWidget {
  const ChessList({super.key});

  @override
  State<StatefulWidget> createState() => _ChessListState();
}

class _ChessListState extends State<ChessList> {
  String activePage = "list-page";
  Logger logger = Logger('My Logger');
  int idx = 0;
  List<ChessItem> chessItems = myChessItems;

  void changePage(int newIdx) {
    setState(() {
      activePage = "chess-item-page";
      idx = newIdx;
    });
  }

  void backToMain() {
    setState(() {
      activePage = "list-page";
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.info(chessItems);
    if (activePage == "list-page") {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Chess List"),
          ),
          body: Center(
              child: ListView.builder(
                  itemCount: chessItems.length,
                  itemBuilder: (context, index) => Card(
                      child: CheckableTodoItem(
                          item: chessItems[index],
                          onPressed: changePage,
                          idx: index)))));
    } else {
      return Scaffold(
          appBar: AppBar(actions: [
            IconButton(
              onPressed: backToMain,
              icon: Transform.rotate(
                angle: -3.14, // 180 degrees in radians
                child: const Icon(Icons.arrow_forward),
              ),
            )
          ], title: Text("Chess Board ${idx + 1}")),
          body: Center(child: ChessBoardPage(item: chessItems[idx])));
    }
  }
}
