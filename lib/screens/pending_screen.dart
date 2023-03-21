import 'package:flutter/material.dart';
import 'package:todokdylist/widgets/taskslist.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});
  static const id = 'task_screen';
  @override
  Widget build(BuildContext context) {
    //

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Column(
          children: [
            Chip(
                shadowColor: Colors.indigo,
                label: Text(
                  '${taskList.length} tasks ${state.completedTask.length} tasks',
                  style: const TextStyle(
                      fontFamily: 'kdyfont',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
            TasksList(tasksList: taskList),
          ],
        );
      },
    );
  }
}
