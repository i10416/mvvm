import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';

abstract class TaskUsecase {
  Task addTask(CreateTaskParams params);
  Set<Task> showAll();
  Task checkTask(Task task);
  Task uncheckTask(Task task);
}