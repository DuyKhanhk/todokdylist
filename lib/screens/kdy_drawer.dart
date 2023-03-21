import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todokdylist/screens/recycle_bin.dart';
import 'package:todokdylist/screens/tabs_screen.dart';

import '../blocs/bloc_exports.dart';

class KdyDrawer extends StatelessWidget {
  const KdyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.indigo,
              child: const Text(
                'Cycle bin',
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'kdyfont',
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.folder_special_outlined,
                      size: 35,
                    ),
                    title: const Text('kdy task',
                        style: TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 40,
                            fontWeight: FontWeight.w200)),
                    trailing: Text('${state.pendingTask.length}',
                        style: const TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.folder_delete_outlined,
                      size: 35,
                    ),
                    title: const Text('bin',
                        style: TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 40,
                            fontWeight: FontWeight.w200)),
                    trailing: Text('${state.removedTask.length}',
                        style: const TextStyle(
                            fontFamily: 'kdyfont',
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchsBloc, SwitchsState>(
              builder: (context, state) {
                return CupertinoSwitch(
                  activeColor: Colors.indigo,
                  value: state.switchValue,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchsBloc>().add(SwitchOnEvent())
                        : context.read<SwitchsBloc>().add(SwitchOffEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
