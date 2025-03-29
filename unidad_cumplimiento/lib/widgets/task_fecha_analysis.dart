import 'package:flutter/material.dart';

class TaskFechaAnalysis extends StatelessWidget {
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final DateTime fechaEntrega;

  const TaskFechaAnalysis({
    Key? key,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaEntrega,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime fechaActual = DateTime.now();

    // Calcula la duración de la tarea
    final int duracionTarea = fechaFin.difference(fechaInicio).inDays;

    // Calcula los días transcurridos
    final int diasTranscurridos = fechaActual.difference(fechaInicio).inDays;

    // Calcula el tiempo restante
    final int tiempoRestante = fechaFin.difference(fechaActual).inDays;

    // Calcula el tiempo para entregar
    final int tiempoParaEntregar = fechaEntrega.difference(fechaActual).inDays;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título del contenedor
        Text(
          'Progreso temporal',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        // Información de la duración de la tarea
        Text(
          'Duración de la tarea:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '$duracionTarea días',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        // Información de los días transcurridos
        Text(
          'Días transcurridos:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '$diasTranscurridos días',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        // Información del tiempo restante
        Text(
          'Tiempo restante:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '$tiempoRestante días${tiempoRestante < 0 ? " (Tarea con retraso)" : ""}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: tiempoRestante < 0 ? Colors.red : null,
              ),
        ),
        const SizedBox(height: 8),
        // Información del tiempo para entregar
        Text(
          'Tiempo para entregar:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '$tiempoParaEntregar días${tiempoParaEntregar < 0 ? " (No se cumplió con la fecha de entrega)" : ""}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: tiempoParaEntregar < 0 ? Colors.red : null,
              ),
        ),
      ],
    );
  }
}