import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/secondary_appbar.dart'; // Importa secondary_appbar.dart
import 'package:unidad_cumplimiento/widgets/descripcion_expandible.dart'; // Importa descripcion_expandible.dart
import 'package:unidad_cumplimiento/widgets/task_fechas_container.dart'; // Importa task_fechas_container.dart

class DetailTaskView extends StatelessWidget {
  final Map<String, dynamic> tarea;

  const DetailTaskView({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        title: 'Detalle de la Tarea',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tarea['TAREA_ACCION'] ?? 'Nombre de la Tarea',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Descripción de la tarea:',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              DescripcionExpandible(
                descripcion: tarea['DESCRIPCION_TAREA_ACCION'] ?? 'Descripción no disponible',
              ),
              const SizedBox(height: 16),
              Text(
                'Fechas de la tarea:',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TaskFechasContainer(
                fechaInicio: DateTime.parse(tarea['F_INICIO']),
                fechaFin: DateTime.parse(tarea['F_FIN']),
                fechaEntrega: DateTime.parse(tarea['F_ENTREGA']),
              ),
              const SizedBox(height: 16),
              Text(
                'Estado: ${tarea['estado'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}