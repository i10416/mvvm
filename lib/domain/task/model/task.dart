import 'package:flutter/cupertino.dart';

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

  @override
  String toString() =>
      'Task<title: $title, description: $description, isCompleted: $isCompleted>';
}
