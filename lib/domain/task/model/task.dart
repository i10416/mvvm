import 'package:flutter/cupertino.dart';

class Task {
  Task(
      this.identifier,
    this.title, {
    this.description = '',
    this.isCompleted = false,
  });
  final int identifier;
  final String title;
  final String description;
  final bool isCompleted;

  Task updateIsCompleted({@required bool isCompleted}) =>
      Task(identifier,title, description: description, isCompleted: isCompleted);

  @override
  String toString() =>
      'Task<$identifier  title: $title, description: $description, isCompleted: $isCompleted>';
}
