import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';
import 'package:todo/domain/task/repository/internal_task_repository.dart';
import 'package:todo/domain/task/usecase/interface/task_usecase.dart';
import 'package:todo/domain/task/usecase/task_application.dart';
import 'package:todo/views/screens/task_list_screen.dart';

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final TaskRepository taskRepo = InternalTaskRepository();
    final TaskUsecase taskUsecase = TaskApplication(taskRepo);

    return MultiProvider(
      providers: [
        Provider.value(value: taskRepo),
        Provider.value(value: taskUsecase),
      ],
      child: CupertinoApp(
        title: 'TODO With provider + ChangeNotifier',
        home: TaskListScreen(),
      ),
    );
  }
}