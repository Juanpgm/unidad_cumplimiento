import 'package:flutter/material.dart';

class TaskMetaContainer extends StatelessWidget {
  final int meta;
  final int unidadesEjecutadas;

  const TaskMetaContainer({
    Key? key,
    required this.meta,
    required this.unidadesEjecutadas,
  }) : super(key: key);

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
    double efectividadTarea = unidadesEjecutadas / meta;
    Map<String, Color> colors = _getEfectividadColor(efectividadTarea);

    return Container(
      padding: const EdgeInsets.all(8.0), // Usa el padding pequeño
      decoration: BoxDecoration(
        color: colors['containerColor'], // Determina el color del contenedor
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$unidadesEjecutadas / $meta',
            style: TextStyle(
              color: colors['textColor'], // Usa el color más oscuro para el texto
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Cumplimiento de Metas',
            style: TextStyle(
              color: colors['textColor'], // Usa el color más oscuro para el texto
              fontSize: 12.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}