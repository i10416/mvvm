import 'package:flutter/cupertino.dart';
import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/usecase/interface/task_usecase.dart';

class TaskListViewModel extends ChangeNotifier {
  TaskListViewModel(this.usecase) {
    updateTaskList(usecase.showAll());
  }

  final TaskUsecase usecase;

  List<Task> taskList;

  void reload() {
    updateTaskList(usecase.showAll());
  }

  void check(Task task) {
    final idx = taskList.indexOf(task);
    final updatedTask = task.updateIsCompleted(isCompleted: true);

     taskList[idx] = updatedTask;
     updateTask(updatedTask);
  }

  void unCheck(Task task) {
    final idx = taskList.indexOf(task);
    final updatedTask = task.updateIsCompleted(isCompleted: false);
    taskList[idx] = updatedTask;
    updateTask(updatedTask);
  }

  void updateTask(Task updatedTask) {
    usecase.updateTask(updatedTask.identifier,updatedTask);
    notifyListeners();
  }

  void updateTaskList(List<Task> tasks) {
    taskList = tasks;
    notifyListeners();
  }
}
