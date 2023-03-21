import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/taskslist.dart';
import 'kdy_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.removedTask;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height / 10,
            leading: Container(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height / 14)),
            ),
            shadowColor: const Color.fromARGB(255, 39, 0, 86),
            title: const Center(
              child: Text(
                'kdy recycle binn_',
                style: TextStyle(
                    fontFamily: 'kdyfont',
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // actions: [
            //   IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            // ],
          ),
          drawer: const KdyDrawer(),
          body: Column(
            children: [
              TasksList(tasksList: taskList),
            ],
          ),
        );
      },
    );
  }
}
