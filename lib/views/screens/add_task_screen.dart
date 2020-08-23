import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/task/usecase/task_application.dart';
import 'package:todo/views/viewModels/add_task_viewmodel.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usecase = TaskApplication(Provider.of(context));
    return ChangeNotifierProvider(
      create: (_)=>AddTaskViewModel(usecase),
      child: Consumer<AddTaskViewModel>(
        builder: (_,viewModel,__)=> CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            padding: EdgeInsetsDirectional.zero,
            automaticallyImplyLeading: false,
            leading: Material(
              child: IconButton(
                icon: const Icon(CupertinoIcons.back),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
            ),
            middle: const Text('add new task'),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CupertinoTextField(
                    controller: viewModel.titleController,
                    autofocus: true,
                    placeholder: 'title',
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CupertinoTextField(
                    controller: viewModel.descriptionController,
                    maxLines: 3,
                    placeholder: 'description',
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    minSize: 24,
                    child: const Text('Save'),
                    onPressed: ()=>viewModel.save(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
