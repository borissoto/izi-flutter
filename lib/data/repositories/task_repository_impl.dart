import 'package:izi_flutter_app/domain/datasource/tasks_datasource.dart';
import 'package:izi_flutter_app/domain/entities/task.dart';
import 'package:izi_flutter_app/domain/repositories/tasks_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TasksDatasource datasource;
  TaskRepositoryImpl(this.datasource);

  @override
  Future<List<Task>> getTasks() {
    return datasource.getTasks();
  }

  @override
  Future<List<Task>> getSortedTasks() {
    return datasource.getSortedTasks();
  }
}
