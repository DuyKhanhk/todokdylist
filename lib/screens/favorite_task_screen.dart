import 'package:flutter/material.dart';
import 'package:todokdylist/widgets/taskslist.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({super.key});
  static const id = 'task_screen';
  @override
  Widget build(BuildContext context) {
    //

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTask;
        return Column(
          children: [
            Chip(label: Text('${taskList.length} tasks')),
            const SizedBox(
              height: 10,
            ),
            TasksList(tasksList: taskList),
          ],
        );
      },
    );
  }
}
