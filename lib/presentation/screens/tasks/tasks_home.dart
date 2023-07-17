import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_flutter_app/data/repositories/task_repository_impl.dart';
import 'package:izi_flutter_app/domain/entities/task.dart';
import 'package:izi_flutter_app/presentation/bloc/task_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Scaffold(
    //   body: _TaskView(),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (BuildContext context) =>
              TaskBloc(RepositoryProvider.of<TaskRepositoryImpl>(context))
                ..add(LoadTasksEvent()),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "iZi Tareas",
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskLoadingState) {
                return const CircularProgressIndicator(color: Colors.orange);
              }
              if (state is TaskLoadedState) {
                List<Task> taskList = state.tasks;
                return ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.grey[50],
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(
                              taskList[index].name,
                              style: const TextStyle(color: Colors.black54),
                            ),
                            subtitle: Text(
                              taskList[index].priority,
                              style: TextStyle(
                                  color: getColor(taskList[index].priority)),
                            ),
                            trailing: Text(
                              "${taskList[index].expiration.day} / ${taskList[index].expiration.month} / ${taskList[index].expiration.year}",
                              style: const TextStyle(color: Colors.black45),
                            ),
                          ),
                        ));
                  },
                );
              }
              if (state is TaskLoadedErrorState) {
                return Text(
                    'Hubo un error al cargar las tareas: ${state.error}');
              } else {
                return const Text('Algo salio mal!');
              }
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
              return FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<TaskBloc>(context)
                      .add(LoadOrderedTasksEvent());
                },
                tooltip: "ordenar",
                label: const Text(
                  'Ordenar',
                  style: (TextStyle(fontSize: 12)),
                ),
                icon: const Icon(Icons.sort_rounded),
              );
            }),
            BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
              return FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<TaskBloc>(context).add(LoadTasksEvent());
                },
                tooltip: "cargar",
                label: const Text(
                  'Cargar',
                  style: (TextStyle(fontSize: 12)),
                ),
                icon: const Icon(Icons.replay_rounded),
              );
            }),
          ],
        ),
      ),
    );
  }

  Color getColor(String priority) {
    if (priority == "alta") {
      return Colors.red;
    } else if (priority == "media") {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
