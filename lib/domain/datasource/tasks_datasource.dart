import 'package:izi_flutter_app/domain/entities/task.dart';

abstract class TasksDatasource {
  Future<List<Task>> getTasks();
  Future<List<Task>> getSortedTasks();
}
