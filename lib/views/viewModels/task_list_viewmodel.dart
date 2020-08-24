import 'package:flutter/cupertino.dart';
import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/usecase/interface/task_usecase.dart';

class TaskListViewModel extends ChangeNotifier {
  TaskListViewModel(this.usecase) {
    _updateTaskList(usecase.showAll());
  }

  final TaskUsecase usecase;

  List<Task> taskList;

  void reload() {
    _updateTaskList(usecase.showAll());
  }

  void check(Task task) {
    final idx = taskList.indexOf(task);
    final updatedTask = task.updateIsCompleted(isCompleted: true);

     taskList[idx] = updatedTask;
     _updateTask(updatedTask);
  }

  void unCheck(Task task) {
    final idx = taskList.indexOf(task);
    final updatedTask = task.updateIsCompleted(isCompleted: false);
    taskList[idx] = updatedTask;
    _updateTask(updatedTask);
  }

  void _updateTask(Task updatedTask) {
    usecase.updateTask(updatedTask.identifier,updatedTask);
    notifyListeners();
  }

  void _updateTaskList(List<Task> tasks) {
    taskList = tasks;
    notifyListeners();
  }
}
