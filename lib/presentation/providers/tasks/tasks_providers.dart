import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:izi_flutter_app/domain/entities/task.dart';
import 'package:izi_flutter_app/presentation/providers/tasks/tasks_repository_provider.dart';

final getTaksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {
  final fetchTasks = ref.watch(taskRepositoryProvider).getTasks;

  return TasksNotifier(fetchTasks: fetchTasks);
});

typedef TaskCallback = Future<List<Task>> Function();

class TasksNotifier extends StateNotifier<List<Task>> {
  // List<Task> fetchTasks = [];

  TaskCallback fetchTasks;

  TasksNotifier({
    required this.fetchTasks,
  }) : super([]);

  Future<void> loadTasks() async {
    final List<Task> tasks = await fetchTasks();
    state = [...state, ...tasks];
  }
}
