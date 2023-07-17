import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:izi_flutter_app/data/repositories/task_repository_impl.dart';
import 'package:izi_flutter_app/domain/entities/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepositoryImpl taskRepositoryImpl;

  TaskBloc(this.taskRepositoryImpl) : super(TaskLoadingState()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        final tasks = await taskRepositoryImpl.getTasks();
        emit(TaskLoadedState(tasks));
      } catch (e) {
        emit(TaskLoadedErrorState(e.toString()));
      }
    });

    on<LoadOrderedTasksEvent>(
      (event, emit) async {
        emit(TaskLoadingState());
        try {
          final orderedTaks = await taskRepositoryImpl.getSortedTasks();
          emit(TaskLoadedState(orderedTaks));
        } catch (e) {
          emit(TaskLoadedErrorState(e.toString()));
        }
      },
    );
  }
}
