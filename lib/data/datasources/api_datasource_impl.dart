import 'package:dio/dio.dart';
import 'package:izi_flutter_app/data/mappers/task_mapper.dart';
import 'package:izi_flutter_app/data/models/task_response.dart';
import 'package:izi_flutter_app/domain/datasource/tasks_datasource.dart';
import 'package:izi_flutter_app/domain/entities/task.dart';

class ApiDatasource extends TasksDatasource {
  // final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8080')); //PC
  final dio = Dio(BaseOptions(baseUrl: 'http://192.168.0.101:8080')); // Macbook M1

  @override
  Future<List<Task>> getTasks() async {
    final response = await dio.get('/api/tareas');
    if (response.statusCode == 200) {
      final taskResponse = TaskResponse.fromJson(response.data);

      final List<Task> tasks = taskResponse.tareas
          .map((tareaApi) => TaskMapper.taskToEntitiy(tareaApi))
          .toList();

      return tasks;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Task>> getSortedTasks() async {
    final response = await dio.get('/api/tareas/ordenar');
    if (response.statusCode == 200) {
      final taskResponse = TaskResponse.fromJson(response.data);

      final List<Task> tasks = taskResponse.tareas
          .map((tareaApi) => TaskMapper.taskToEntitiy(tareaApi))
          .toList();

      return tasks;
    } else {
      throw Exception();
    }
  }
}
