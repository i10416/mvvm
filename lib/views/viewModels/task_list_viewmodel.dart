import 'package:flutter/cupertino.dart';
import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/usecase/interface/task_usecase.dart';

class TaskListViewModel extends ChangeNotifier {
  TaskListViewModel(this.usecase) {
    _updateTaskList(usecase.showAll());
  }

  final TaskUsecase usecase;

  Set<Task> taskList;

  void reload() {
    _updateTaskList(usecase.showAll());
  }

  void check(Task task) {
    final updatedTask = task.updateIsCompleted(isCompleted: true);
    _updateTask(task,updatedTask);
  }

  void unCheck(Task task) {
    final updatedTask = task.updateIsCompleted(isCompleted: false);
    _updateTask(task,updatedTask);
  }

  void _updateTask(Task task,Task updatedTask) {
    print('task ${task.toString()}');
    taskList = taskList.map((e) => e == task ? updatedTask : e).toSet();
    usecase.updateTask(task,updatedTask);
    notifyListeners();
  }

  void _updateTaskList(Set<Task> tasks) {
    taskList = tasks;
    notifyListeners();
  }
}
