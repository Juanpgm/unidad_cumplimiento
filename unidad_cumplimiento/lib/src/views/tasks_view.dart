import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/secondary_appbar.dart'; // Importa secondary_appbar.dart
import 'package:unidad_cumplimiento/widgets/custom_drawer.dart'; // Importa custom_drawer.dart
import 'package:unidad_cumplimiento/widgets/task_list_view.dart'; // Importa task_list_view.dart
import 'package:unidad_cumplimiento/widgets/custom_search_bar.dart'; // Importa custom_search_bar.dart
import 'package:unidad_cumplimiento/widgets/custom_add_button.dart'; // Importa custom_add_button.dart
import 'package:unidad_cumplimiento/widgets/custom_filter.dart'; // Importa custom_filter.dart
import 'package:unidad_cumplimiento/src/datos_proceso.dart'; // Importa datos_proceso.dart

class TasksView extends StatefulWidget {
  final String nombreProceso;

  const TasksView({Key? key, required this.nombreProceso}) : super(key: key);

  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, bool> tipoTarea = {
    'Gestión Operativa': false,
    'Gestión Administrativa': false,
    'Gestión Presupuestal': false,
    'Gestión Técnica': false,
    'Gestión Gerencial': false,
    'Gestión Contractual': false,
  };
  final Map<String, bool> estadosTarea = {
    'Registrada': false,
    'En ejecución': false,
    'Pausada': false,
    'Completada': false,
  };

  List<Map<String, dynamic>> tareasFiltradas = [];

  @override
  void initState() {
    super.initState();
    _filtrarTareas();
  }

  void _filtrarTareas() {
    final proceso = procesos.firstWhere((proceso) => proceso['nombreProceso'] == widget.nombreProceso, orElse: () => {});
    final tareas = proceso['tareas'] ?? [];

    setState(() {
      tareasFiltradas = tareas.where((tarea) {
        final tipoSeleccionado = tipoTarea.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
        final estadoSeleccionado = estadosTarea.entries.where((entry) => entry.value).map((entry) => entry.key).toList();

        final tipoValido = tipoSeleccionado.isEmpty || tipoSeleccionado.contains(tarea['tipo']);
        final estadoValido = estadoSeleccionado.isEmpty || estadoSeleccionado.contains(tarea['estado']);

        return tipoValido && estadoValido;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SecondaryAppBar(
        title: 'Actividades del Proceso',
      ),
      drawer: const CustomDrawer(), // Añade el CustomDrawer
      body: Column(
        children: [
          CustomSearchBar(
            hintText: 'Buscar actividades...',
            onSearchChanged: (value) {
              // Implement your search logic here
            },
          ), // Añade el CustomSearchBar
          CustomFilter(
            group1: tipoTarea,
            group2: estadosTarea,
            onGroup1Changed: (newGroup1) {
              setState(() {
                tipoTarea.addAll(newGroup1);
                _filtrarTareas();
              });
            },
            onGroup2Changed: (newGroup2) {
              setState(() {
                estadosTarea.addAll(newGroup2);
                _filtrarTareas();
              });
            },
          ),
          Expanded(
            child: TaskListView(tareas: tareasFiltradas),
          ),
        ],
      ),
      floatingActionButton: CustomAddButton(
        onPressed: () {
          // Implement your add button logic here
        },
      ),
    );
  }
}