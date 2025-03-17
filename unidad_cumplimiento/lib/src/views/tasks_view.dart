import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/main_appbar.dart'; // Importa main_appbar.dart
import 'package:unidad_cumplimiento/widgets/custom_drawer.dart'; // Importa custom_drawer.dart
import 'package:unidad_cumplimiento/widgets/task_list_view.dart'; // Importa task_list_view.dart
import 'package:unidad_cumplimiento/src/datos_proceso.dart'; // Importa datos_proceso.dart

class TasksView extends StatelessWidget {
  final String nombreProceso;

  const TasksView({Key? key, required this.nombreProceso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // Encuentra el proceso correspondiente por nombre
    final proceso = procesos.firstWhere((proceso) => proceso['nombreProceso'] == nombreProceso, orElse: () => {});

    return Scaffold(
      key: scaffoldKey,
      appBar: MainAppBar(
        title: 'Actividades de: $nombreProceso',
        onMenuPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: const CustomDrawer(), // Añade el CustomDrawer
      body: TaskListView(tareas: proceso['tareas']),
    );
  }
}