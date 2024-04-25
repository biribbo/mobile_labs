import 'package:logging/logging.dart';

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  today
}

class Task {
  final int id;
  final String name;
  final bool isDone;
  final Day day;

  const Task(this.day, this.isDone, {required this.id, required this.name});
}

class TaskBucket {
  Logger logger = Logger("task_bucket_logger");
  final Day day;
  final List<Task> tasks;

  TaskBucket({required this.day, required this.tasks});

  TaskBucket.forDay(List<Task> allTasks, this.day)
      : tasks = allTasks.where((task) => task.day == day).toList();

  int get sumAll {
    int sumAll = 0;

    for (var _ in tasks) {
      sumAll++;
    }
    return sumAll;
  }

  int get sumDone {
    int sumDone = 0;

    for (var task in tasks) {
      if (task.isDone) {
        sumDone++;
      }
    }
    return sumDone;
  }

  double get tasksDone {
    return sumDone / sumAll;
  }

  double get averageTasksDoneExceptToday {
    var otherDaysTasks = tasks.where((task) => task.day != Day.today).toList();
    var sumDoneOtherDays = otherDaysTasks.where((task) => task.isDone).length;
    logger.info(sumDoneOtherDays);
    return sumDoneOtherDays / 7;
  }
}
