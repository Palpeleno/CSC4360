class Task {
  String task;
  DateTime time;

  Task({this.task, this.time});

  factory Task.fromString(String task) {
    return Task(
      task: task,
      time: DateTime.now(),
    );
  }
}
