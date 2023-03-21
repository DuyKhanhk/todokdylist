import 'package:flutter/material.dart';
import 'package:todokdylist/blocs/bloc_exports.dart';
import 'package:todokdylist/sevices/auto_id.dart';

import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const Text(
            'Add new task',
            style: TextStyle(
                fontFamily: 'kdyfont',
                fontSize: 40,
                fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            width: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                label: Text('Title',
                    style: TextStyle(
                        fontFamily: 'kdyfont',
                        fontSize: 30,
                        fontWeight: FontWeight.w200))),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: descriptionController,
            minLines: 3,
            maxLines: 6,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                label: Text('Description',
                    style: TextStyle(
                        fontFamily: 'kdyfont',
                        fontSize: 30,
                        fontWeight: FontWeight.w200))),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: const Text('Cancel',
                        style: TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 25,
                            fontWeight: FontWeight.w200)),
                  )),
              OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) =>
                              const Color.fromARGB(255, 206, 162, 255))),
                  onPressed: () {
                    var task = Task(
                      date: DateTime.now().toString(),
                        title: titleController.text,
                        description: descriptionController.text,
                        id: GUIDGen.generate());
                    context.read<TaskBloc>().add(AddTask(
                          task: task,
                        ));
                    titleController.text = '';
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: const Text('Add',
                        style: TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 25,
                            fontWeight: FontWeight.w200)),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
