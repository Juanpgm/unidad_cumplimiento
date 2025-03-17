import 'package:flutter/material.dart';
import 'task_container.dart';

class TaskListView extends StatelessWidget {
  final List<Map<String, dynamic>> tareas;

  const TaskListView({Key? key, required this.tareas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        return TaskContainer(tarea: tareas[index]);
      },
    );
  }
}