import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';

abstract class TaskUsecase {
  Task addTask(CreateTaskParams params);
  void updateTask(int identifier,Task task);
  List<Task> showAll();
}