import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/task/model/task.dart';

class TaskListItemWidget extends StatelessWidget {
  const TaskListItemWidget(this.task,
      {@required this.callback, @required this.onTap});

  final Task task;
  final Function(bool) callback;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
            child: Row(
          children: [
            Expanded(
              flex: 7,
              child: ListTile(
                title: Text(task.title),
                onTap: onTap,
              ),
            ),
            Checkbox(
              value: task.isCompleted,
              onChanged: callback,
            ),
          ],
        )),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}
/*
*ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: task.isCompleted,
                  onChanged: callback,
                ),
              ],
            )
          ),,*/
