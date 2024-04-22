import 'package:flutter/material.dart';
import 'package:lab_3/chess_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chess App", theme: ThemeData.dark(), home: const ChessList());
  }
}
