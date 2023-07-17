import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:izi_flutter_app/data/datasources/api_datasource_impl.dart';
import 'package:izi_flutter_app/data/repositories/task_repository_impl.dart';

final taskRepositoryProvider = Provider((ref) {
  return TaskRepositoryImpl(ApiDatasource());
});
