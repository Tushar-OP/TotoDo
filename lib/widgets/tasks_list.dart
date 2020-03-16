import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododo/widgets/task_tile.dart';
import 'package:tododo/models/task_data.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChanged: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longpressCallback: () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
