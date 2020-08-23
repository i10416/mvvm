import 'package:todo/domain/task/model/task.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';

class InternalTaskRepository extends TaskRepository {
  // この処理についてはsingleton, dartなどのキーワードで調べてください.
  // また本来はuuidを使って識別子をつけないといけないのですがそれを省いているため削除は出来ません.
  factory InternalTaskRepository() {
    return _cache;
  }
  InternalTaskRepository._internal();
  static final InternalTaskRepository _cache =
      InternalTaskRepository._internal();




  List<Task> taskList = [];

  @override
  List<Task> getAll() {
    return taskList;
  }

  @override
  void updateTask(int identifier, Task task) {
    taskList[identifier] = task;
    print('update task ${task.toString()}');
  }

  @override
  Task create(CreateTaskParams params) {
    final identifier = taskList.length;
    final task =
        Task(identifier, params.title, description: params.description);
    taskList.add(task);
    return task;
  }
}
