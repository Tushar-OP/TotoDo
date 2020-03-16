import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChanged;
  final Function checkboxCallback;
  final Function longpressCallback;

  TaskTile(
      {this.taskTitle,
      this.isChanged,
      this.checkboxCallback,
      this.longpressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChanged ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        checkColor: Colors.lightBlueAccent,
        value: isChanged,
        onChanged: checkboxCallback,
      ),
      onLongPress: longpressCallback,
    );
  }
}
