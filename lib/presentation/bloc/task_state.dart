part of 'task_bloc.dart';

abstract class TaskState extends Equatable {}

class TaskLoadingState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TaskState {
  TaskLoadedState(this.tasks);
  final List<Task> tasks;

  @override
  List<Object> get props => [tasks];
}

class TaskLoadedErrorState extends TaskState {
  TaskLoadedErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
