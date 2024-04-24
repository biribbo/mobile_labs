import 'package:flutter/material.dart';
import 'package:lab_3/chart/chart.dart';
import 'package:lab_3/task.dart';
import 'package:lab_3/tasks.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final bucket = TaskBucket.forDay(tasks, Day.today);
  late var sumAll = 0;
  late var sumDone = 0;
  late var average = 0.0;

  @override
  Widget build(BuildContext context) {
    sumAll = bucket.sumAll;
    sumDone = bucket.sumDone;
    average = bucket.averageTasksDoneExceptToday;
    return Scaffold(
        appBar: AppBar(title: const Text("Task stats")),
        body: Column(
          children: [
            const Chart(
              tasks: tasks,
            ),
            Card(
              child: Row(
                children: [
                  const Text("Today's tasks"),
                  Text("$sumDone/$sumAll")
                ],
              ),
            ),
            Card(
              child: Row(
                children: [const Text("Average tasks done"), Text("$average")],
              ),
            )
          ],
        ));
  }
}
