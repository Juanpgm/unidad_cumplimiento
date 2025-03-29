import 'package:flutter/material.dart';

class TaskTimeProgressBar extends StatelessWidget {
  final int diasTranscurridos;
  final int duracionTarea;

  const TaskTimeProgressBar({
    Key? key,
    required this.diasTranscurridos,
    required this.duracionTarea,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcula el progreso como un valor entre 0 y 1
    final double progreso = diasTranscurridos / duracionTarea;

    // Determina el color de la barra
    final Color barraColor = diasTranscurridos > duracionTarea
        ? Colors.red // Rojo si los días transcurridos superan la duración
        : Colors.grey.shade800; // Gris oscuro por defecto

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tiempo transcurrido de la tarea:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            // Fondo de la barra de progreso
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Fondo gris claro
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Barra de progreso
            FractionallySizedBox(
              widthFactor: progreso > 1 ? 1 : progreso, // Limita el progreso a 1 (100%)
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: barraColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Texto que muestra los días transcurridos y la duración total
        Text(
          '$diasTranscurridos / $duracionTarea días',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}