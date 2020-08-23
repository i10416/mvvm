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

  void check(int idx) {
     taskList[idx] = taskList[idx].updateIsCompleted(isCompleted: true);
     updateTask(taskList[idx]);
  }

  void unCheck(int idx) {
    taskList[idx] = taskList[idx].updateIsCompleted(isCompleted: false);
    updateTask(taskList[idx]);
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
