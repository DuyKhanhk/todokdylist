// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todokdylist/models/task.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeteleCallback;
  final VoidCallback likeOrDisLike;
  final Task task;
  const PopupMenu({
    required this.task,
    required this.likeOrDisLike,
    required this.cancelOrDeteleCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text(
                        'edit',
                        style: TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text(
                                'bookmark',
                                style: TextStyle(
                                    fontFamily: 'kdyfont',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              )
                            : const Text(
                                'bookmark \nremove',
                                style: TextStyle(
                                    fontFamily: 'kdyfont',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              )),
                    onTap:  likeOrDisLike,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text(
                          'detele',
                          style: TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        )),
                    onTap: () => cancelOrDeteleCallback,
                  ),
                ]
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text(
                          'restore',
                          style: TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        )),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text(
                          'detele forever',
                          style: TextStyle(
                              fontFamily: 'kdyfont',
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        )),
                    onTap: () => cancelOrDeteleCallback,
                  ),
                ]);
  }
}

// Container(
//       color: listColors[number % listColors.length],
//       child: ListTile(
//         iconColor: listColors[number % listColors.length],
//         title: Text(
//           task.title,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               fontFamily: 'kdyfont',
//               fontSize: 28,
//               fontWeight: FontWeight.w500,
//               decoration: task.isDone! ? TextDecoration.lineThrough : null),
//         ),
//         trailing: Checkbox(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.5)),
//           value: task.isDone,
//           onChanged: !task.isDeleted!
//               ? (value) {
//                   // ignore: avoid_single_cascade_in_expression_statements
//                   context.read<TaskBloc>()..add(UpdateTask(task: task));
//                 }
//               : null,
//         ),
//         onLongPress: () => _removedOrDeletedTask(context, task),
//       ),
//     );
