import 'package:intl/intl.dart';
import 'package:todokdylist/widgets/popup_menu.dart';

import '../blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.listColors,
    required this.number,
    required this.task,
  });

  final List<Color> listColors;
  final int number;
  final Task task;

  void _removedOrDeletedTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemovedTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Row(children: [
              task.isFavorite == false
                  ? const Icon(Icons.star_border_purple500)
                  : const Icon(Icons.star),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                    ),
                    Text(DateFormat.yMEd()
                        .add_jms()
                        .format(DateTime.parse(task.date)))
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.5)),
                    value: task.isDone,
                    onChanged: !task.isDeleted!
                        ? (value) {
                            // ignore: avoid_single_cascade_in_expression_statements
                            context.read<TaskBloc>()
                              ..add(UpdateTask(task: task));
                          }
                        : null,
                  ),
                ),
                Expanded(
                  child: PopupMenu(
                    likeOrDisLike: () => context
                        .read<TaskBloc>()
                        .add(MarkFavoriteOrUnfavoriteTask(task: task)),
                    task: task,
                    cancelOrDeteleCallback: () =>
                        _removedOrDeletedTask(context, task),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
