import 'package:flutter/material.dart';
import 'package:todokdylist/screens/add_task_screen.dart';
import 'package:todokdylist/screens/completed_screen.dart';
import 'package:todokdylist/screens/favorite_task_screen.dart';
import 'package:todokdylist/screens/pending_screen.dart';

import 'kdy_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pagesDetails = [
    {'pageName': const KdyDrawer(), 'title': 'Lists_'},
    {'pageName': const PendingScreen(), 'title': 'Pending Taskss_'},
    {'pageName': const CompletedScreen(), 'title': 'Completed Taskss_'},
    {'pageName': const FavoriteTaskScreen(), 'title': 'Favorite Taskss_'},
  ];

  var selectIndexScreen = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height / 25)),
        ),
        context: context,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          _pagesDetails[selectIndexScreen]['title'],
          style: const TextStyle(
              fontFamily: 'kdyfont', fontSize: 40, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        ],
      ),
      drawer: const KdyDrawer(),
      body: _pagesDetails[selectIndexScreen]['pageName'],
      floatingActionButton: selectIndexScreen == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              tooltip: 'Add task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndexScreen,
        onTap: (index) {
          setState(() {
            selectIndexScreen = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pending), label: 'Pending Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_sharp), label: 'Completed Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Task'),
        ],
      ),
    );
  }
}
