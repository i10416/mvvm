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
    final updatedTask = usecase.checkTask(task);
    _updateTask(task,updatedTask);
  }

  void unCheck(Task task) {
    final updatedTask = usecase.uncheckTask(task);
    _updateTask(task,updatedTask);
  }

  void _updateTask(Task task,Task updatedTask) {
    taskList = taskList.map((e) => e == task ? updatedTask : e).toSet();
    notifyListeners();
  }

  void _updateTaskList(Set<Task> tasks) {
    taskList = tasks;
    notifyListeners();
  }
}
