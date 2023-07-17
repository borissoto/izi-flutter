class Task {
  final int id;
  final String name;
  final String priority;
  final DateTime expiration;

  Task(
      {required this.id,
      required this.name,
      required this.priority,
      required this.expiration});
}
