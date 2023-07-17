part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}

class LoadOrderedTasksEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}
