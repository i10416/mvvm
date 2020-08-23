import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';
import 'package:todo/domain/task/usecase/interface/task_usecase.dart';

class TaskApplication extends TaskUsecase {

  TaskApplication(this.taskRepo);

  final TaskRepository taskRepo;

  @override
  Task addTask(CreateTaskParams params) {
    final task = taskRepo.create(params);
    return task;
  }


  @override
  List<Task> showAll() {
    return taskRepo.getAll();
  }

  @override
  void updateTask(int identifier,Task task) {
    taskRepo.updateTask(identifier,task);
  }

}