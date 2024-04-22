import 'package:flutter/material.dart';
import 'package:lab_3/chess_item.dart';

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(
      {super.key,
      required this.item,
      required this.onPressed,
      required this.idx});

  final ChessItem item;
  final Function onPressed;
  final int idx;

  @override
  State<CheckableTodoItem> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  void _setDone(bool? isChecked) {
    setState(() {
      widget.item.isDone = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var done = widget.item.isDone;
    var text = widget.item.description;
    var board = widget.item.board;
    var icon = Icons.wb_sunny;

    if (widget.item.difficultyLevel == DifficultyLevel.medium) {
      icon = Icons.lightbulb;
    } else if (widget.item.difficultyLevel == DifficultyLevel.hard) {
      icon = Icons.local_fire_department;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
              value: done, onChanged: _setDone, shape: const CircleBorder()),
          const SizedBox(width: 6),
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: RepaintBoundary(
                key: GlobalKey(),
                child: board,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(text),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                const SizedBox(width: 12),
                Icon(icon),
                ElevatedButton(
                  onPressed: () {
                    widget.onPressed(widget.idx);
                  },
                  child: const Icon(Icons.arrow_right_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
