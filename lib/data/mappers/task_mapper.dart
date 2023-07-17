import 'package:izi_flutter_app/data/models/task_response.dart';
import 'package:izi_flutter_app/domain/entities/task.dart';

class TaskMapper {
  static Task taskToEntitiy(Tarea taskResponse) => Task(
      id: taskResponse.id,
      name: taskResponse.nombre,
      priority: taskResponse.prioridad,
      expiration: taskResponse.fechaVencimiento);
}
