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
  final allBucket = TaskBucket(day: Day.today, tasks: tasks);
  late var sumAll = 0;
  late var sumDone = 0;
  late var average = 0.0;

  @override
  Widget build(BuildContext context) {
    sumAll = bucket.sumAll;
    sumDone = bucket.sumDone;
    average = allBucket.averageTasksDoneExceptToday;
    return Scaffold(
        appBar: AppBar(title: const Text("Task stats")),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            const Chart(
              tasks: tasks,
            ),
            const SizedBox(height: 50),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 32.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Row(children: [
                        Text(
                          "Today's tasks",
                          style: TextStyle(fontSize: 22.0),
                        )
                      ]),
                    ),
                    Flexible(
                        flex: 0,
                        child: Row(
                          children: [
                            Text(
                              "$sumDone/$sumAll",
                              style: const TextStyle(fontSize: 22.0),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 32.0),
                child: Row(children: [
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Average tasks done",
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          average.toStringAsFixed(2),
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )
          ]),
        ));
  }
}
