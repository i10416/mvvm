import 'package:todo/domain/task/model/task.dart';

abstract class TaskRepository {
  List<Task> getAll();
  void updateTask(int identifier,Task task);
  Task create(CreateTaskParams params);
}

class CreateTaskParams {
  CreateTaskParams(this.title,{this.description=''});
  final String title;
  final String description;
}