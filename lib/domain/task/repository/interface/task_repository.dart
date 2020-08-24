import 'package:todo/domain/task/model/task.dart';

abstract class TaskRepository {
  Set<Task> getAll();
  void updateTask(Task task,Task updatedTask);
  Task create(CreateTaskParams params);
}

class CreateTaskParams {
  CreateTaskParams(this.title,{this.description=''});
  final String title;
  final String description;
}