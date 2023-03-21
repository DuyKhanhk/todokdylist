part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({required this.task});
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RemovedTask extends TaskEvent {
  final Task task;
  const RemovedTask({required this.task});
}

class MarkFavoriteOrUnfavoriteTask extends TaskEvent {
  final Task task;
  const MarkFavoriteOrUnfavoriteTask({required this.task});
  // List<Object> get progs => [task];
}
