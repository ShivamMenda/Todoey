import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                longPressCallBack: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (bool checkboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
