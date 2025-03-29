import 'package:flutter/material.dart';

class TaskEjecucionPresupuesto extends StatelessWidget {
  final double pptoAsignado;
  final double pptoEjecutado;
  final Color containerColor;
  final Color textColor;

  const TaskEjecucionPresupuesto({
    super.key,
    required this.pptoAsignado,
    required this.pptoEjecutado,
    required this.containerColor,
    required this.textColor,
  });

  Map<String, Color> _getColors(double porcentajeEjecucion) {
    Color darken(Color color, double amount) {
      final hsl = HSLColor.fromColor(color);
      final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
      return hslDark.toColor();
    }

    if (porcentajeEjecucion <= 30) {
      return {'containerColor': Colors.red, 'textColor': darken(Colors.red, 0.6)};
    } else if (porcentajeEjecucion <= 50) {
      return {'containerColor': Colors.orange, 'textColor': darken(Colors.orange, 0.6)};
    } else if (porcentajeEjecucion <= 75) {
      return {'containerColor': Colors.yellow, 'textColor': darken(Colors.yellow, 0.6)};
    } else if (porcentajeEjecucion <= 90) {
      return {'containerColor': Colors.blue, 'textColor': darken(Colors.blue, 0.6)};
    } else if (porcentajeEjecucion <= 105) {
      return {'containerColor': Colors.green, 'textColor': darken(Colors.green, 0.6)};
    } else {
      return {'containerColor': const Color.fromARGB(255, 53, 53, 53), 'textColor': Colors.red};
    }
  }

  @override
  Widget build(BuildContext context) {
    double porcentajeEjecucion = (pptoEjecutado / pptoAsignado) * 100;
    Map<String, Color> colors = _getColors(porcentajeEjecucion);

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
            '${porcentajeEjecucion.toStringAsFixed(2)}%',
            style: TextStyle(
              color: colors['textColor'], // Usa el color más oscuro para el texto
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Ejecución Presupuestal',
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