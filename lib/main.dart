import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:izi_flutter_app/config/router/app_router.dart';
import 'package:izi_flutter_app/config/theme/app_theme.dart';
import 'package:izi_flutter_app/data/datasources/api_datasource_impl.dart';
import 'package:izi_flutter_app/data/repositories/task_repository_impl.dart';

void main() {
  // runApp(const ProviderScope(child: MainApp()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepositoryImpl(ApiDatasource()),
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
