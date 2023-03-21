import 'package:flutter/material.dart';
import 'package:todokdylist/widgets/task_tile.dart';

import '../models/task.dart';

// ignore: must_be_immutable
class TasksList extends StatelessWidget {
  TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;
  List<Color> listColors = [
    Colors.indigo,
    Colors.indigoAccent,
    Colors.lightBlue
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            dividerColor: Colors.indigo,
            children: tasksList
                .map((e) => ExpansionPanelRadio(
                    value: e.id,
                    headerBuilder: (context, isExpanded) =>
                        TaskTile(listColors: listColors, number: 1, task: e),
                    backgroundColor: Colors.indigoAccent,
                    body: ListTile(
                      title: SelectableText.rich(TextSpan(children: [
                        const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: e.title,
                          style: const TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        ),
                        const TextSpan(
                          text: '\n\ndescription\n',
                          style: TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: e.description,
                          style: const TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        )
                      ])),
                    )))
                .toList()),
      ),
    );
  }
}

// Expanded(
//       child: Center(
//           child: ListView.builder(
//               itemCount: tasksList.length,
//               itemBuilder: (context, index) {
//                 var task = tasksList[index];
//                 var number = index;
//                 return TaskTile(listColors: listColors, number: number, task: task);
//               })),
//     );