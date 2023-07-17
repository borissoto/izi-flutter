class TaskResponse {
  List<Tarea> tareas;

  TaskResponse({
    required this.tareas,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
        tareas: List<Tarea>.from(json["tareas"].map((x) => Tarea.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tareas": List<dynamic>.from(tareas.map((x) => x.toJson())),
      };
}

class Tarea {
  int id;
  String nombre;
  String prioridad;
  DateTime fechaVencimiento;

  Tarea({
    required this.id,
    required this.nombre,
    required this.prioridad,
    required this.fechaVencimiento,
  });

  factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
        id: json["id"],
        nombre: json["nombre"],
        prioridad: json["prioridad"],
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "prioridad": prioridad,
        "fechaVencimiento":
            "${fechaVencimiento.year.toString().padLeft(4, '0')}-${fechaVencimiento.month.toString().padLeft(2, '0')}-${fechaVencimiento.day.toString().padLeft(2, '0')}",
      };
}
