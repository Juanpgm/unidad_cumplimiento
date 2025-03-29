import 'package:flutter/material.dart';

class TaskMetaProgressBar extends StatelessWidget {
  final int unidadesEjecutadas;
  final int meta;

  const TaskMetaProgressBar({
    Key? key,
    required this.unidadesEjecutadas,
    required this.meta,
  }) : super(key: key);

  // Método para obtener los colores según la efectividad
  Map<String, Color> _getEfectividadColor(double efectividadTarea) {
    Color darken(Color color, double amount) {
      final hsl = HSLColor.fromColor(color);
      final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
      return hslDark.toColor();
    }

    if (efectividadTarea <= 0.30) {
      return {'containerColor': Colors.red, 'textColor': darken(Colors.red, 0.6)};
    } else if (efectividadTarea <= 0.50) {
      return {'containerColor': Colors.orange, 'textColor': darken(Colors.orange, 0.6)};
    } else if (efectividadTarea <= 0.75) {
      return {'containerColor': Colors.yellow, 'textColor': darken(Colors.yellow, 0.6)};
    } else if (efectividadTarea <= 0.99) {
      return {'containerColor': Colors.blue, 'textColor': darken(Colors.blue, 0.6)};
    } else {
      return {'containerColor': Colors.green, 'textColor': darken(Colors.green, 0.6)};
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calcula el progreso como un valor entre 0 y 1
    final double progreso = meta > 0 ? (unidadesEjecutadas / meta).clamp(0.0, 1.0) : 0.0;

    // Obtiene los colores según el progreso
    final colors = _getEfectividadColor(progreso);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progreso: ${unidadesEjecutadas}/${meta}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors['textColor'], // Aplica el color dinámico al texto
              ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
          child: LinearProgressIndicator(
            value: progreso, // Progreso entre 0 y 1
            minHeight: 16, // Aumenta el grosor de la barra
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              colors['containerColor']!, // Aplica el color dinámico a la barra
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          progreso >= 1.0
              ? '¡Meta alcanzada!'
              : 'Continúa trabajando para alcanzar la meta.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colors['textColor'], // Aplica el color dinámico al texto
              ),
        ),
      ],
    );
  }
}