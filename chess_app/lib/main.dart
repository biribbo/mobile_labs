import 'package:flutter/material.dart';
import 'package:lab_3/chess_list.dart';
import 'task_widget.dart';

void main() {
  runApp(MaterialApp(
      title: "Chess App", theme: ThemeData.dark(), home: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const ChessList(),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: ClipOval(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Icon(Icons.chat_rounded, color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }
}
