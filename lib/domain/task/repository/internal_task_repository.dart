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




  Set<Task> taskList = {};

  @override
  Set<Task> getAll() {
    return taskList;
  }

  @override
  void updateTask(Task task,Task updated) {
    taskList = taskList.map((e) => e == task ? updated : e).toSet();
    print('update task ${task.toString()}');
  }

  @override
  Task create(CreateTaskParams params) {
    final task =
        Task(params.title, description: params.description);
    taskList.add(task);
    return task;
  }
}
