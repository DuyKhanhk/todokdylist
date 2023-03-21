// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> favoriteTask;
  final List<Task> removedTask;
  const TaskState(
      {this.pendingTask = const <Task>[],
      this.removedTask = const <Task>[],
      this.completedTask = const <Task>[],
      this.favoriteTask = const <Task>[]});

  @override
  List<Object> get props =>
      [pendingTask, removedTask, completedTask, favoriteTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTask': pendingTask.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTask: List<Task>.from(
        (map['pendingTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedTask: List<Task>.from(
        (map['removedTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedTask: List<Task>.from(
        (map['completedTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favoriteTask: List<Task>.from(
        (map['favoriteTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
