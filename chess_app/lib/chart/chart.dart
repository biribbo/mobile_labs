import 'package:flutter/material.dart';
import 'package:lab_3/chart/char_bar.dart';
import 'package:lab_3/task.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.tasks});

  final List<Task> tasks;

  List<TaskBucket> get buckets {
    return [
      TaskBucket.forDay(tasks, Day.monday),
      TaskBucket.forDay(tasks, Day.tuesday),
      TaskBucket.forDay(tasks, Day.wednesday),
      TaskBucket.forDay(tasks, Day.thursday),
      TaskBucket.forDay(tasks, Day.friday),
      TaskBucket.forDay(tasks, Day.saturday),
      TaskBucket.forDay(tasks, Day.sunday),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.1)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(fill: bucket.tasksDone)
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(bucket.day.toString().substring(4, 7),
                          textAlign: TextAlign.center),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
