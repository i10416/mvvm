import 'package:flutter/cupertino.dart';
import 'package:todo/domain/task/values/update_task_params.dart';

class Task {
  Task(
    this.title, {
    this.description = '',
    this.isCompleted = false,
  });

  final String title;
  final String description;
  final bool isCompleted;

  Task updateIsCompleted({@required bool isCompleted}) =>
      Task(title, description: description, isCompleted: isCompleted);

  Task update(UpdateTaskParams params) {
    return Task(params.title,
        description: params.description, isCompleted: params.isDone);
  }

  UpdateTaskParams buildUpdateParams(
      {String title, String description, bool isCompleted}) {
    return UpdateTaskParams(
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isCompleted ?? this.isCompleted);
  }

  @override
  String toString() =>
      'Task<title: $title, description: $description, isCompleted: $isCompleted>';
}
