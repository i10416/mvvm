import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';
import 'package:todo/domain/task/usecase/task_application.dart';
import 'package:todo/views/components/task/task_list_item_widget.dart';
import 'package:todo/views/screens/add_task_screen.dart';
import 'package:todo/views/screens/show_task_screen.dart';
import 'package:todo/views/viewModels/task_list_viewmodel.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<TaskRepository>(context);
    final usecase = TaskApplication(repo);
    return ChangeNotifierProvider(
        create: (_) => TaskListViewModel(usecase),
        child: Consumer<TaskListViewModel>(
            builder: (_, viewModel, __) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                      trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        child: IconButton(
                          iconSize: 32,
                          icon: const Icon(CupertinoIcons.refresh),
                          onPressed: () => viewModel.reload(),
                        ),
                      ),
                      Material(
                        child: IconButton(
                          iconSize: 32,
                          icon: const Icon(CupertinoIcons.add),
                          onPressed: () => Navigator.of(context)
                              .push<void>(CupertinoPageRoute(
                                builder: (_) => AddTaskScreen(),
                              ))
                              .then((_) => viewModel.reload()),
                        ),
                      ),
                    ],
                  )),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, idx) {
                      final task = viewModel.taskList[idx];
                      return TaskListItemWidget(
                        task,
                        callback: (isCheck) => isCheck
                            ? viewModel.check(task)
                            : viewModel.unCheck(task),
                        onTap: () => Navigator.of(context)
                            .push<void>(CupertinoPageRoute(
                              builder: (_) => ShowTaskScreen(task),
                            ))
                            .then((_) => viewModel.reload()),
                      );
                    },
                    itemCount: viewModel.taskList.length,
                  ),
                )));
  }
}
