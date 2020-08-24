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
  Set<Task> showAll() {
    return taskRepo.getAll();
  }

  @override
  Task checkTask(Task task) {
    final params = task.buildUpdateParams(isCompleted: true);
    final updatedTask = task.update(params);
    taskRepo.updateTask(task, updatedTask);
    return updatedTask;
  }
  @override
  Task uncheckTask(Task task){
    final params = task.buildUpdateParams(isCompleted: false);
    final updatedTask = task.update(params);
    taskRepo.updateTask(task, updatedTask);
    return updatedTask;
  }

}