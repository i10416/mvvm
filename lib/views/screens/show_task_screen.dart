import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/task/model/task.dart';

class ShowTaskScreen extends StatelessWidget {
  ShowTaskScreen(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        automaticallyImplyLeading: false,
        leading: Material(
          child: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        middle: const Text('detail'),
      ),
      child: Column(
        children: [
          const SizedBox(height: 100,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(child: Text(task.title,style: TextStyle(fontSize: 24),),)
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Text(task.description)),
          ),

        ],
      ),
    );
  }
}
