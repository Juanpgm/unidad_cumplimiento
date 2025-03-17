import 'package:flutter/material.dart';

class TaskStateContainer extends StatelessWidget {
  final String state_text;

  TaskStateContainer({required this.state_text});

  Map<String, Color> _getStateColors(String state) {
    Color darken(Color color, double amount) {
      final hsl = HSLColor.fromColor(color);
      final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
      return hslDark.toColor();
    }

    if (state == "Registrada") {
      return {'containerColor': Colors.red, 'textColor': darken(Colors.red, 0.6)};
    } else if (state == "En Ejecución") {
      return {'containerColor': Colors.yellow, 'textColor': darken(Colors.yellow, 0.6)};
    } else if (state == "Pausada") {
      return {'containerColor': Colors.purple, 'textColor': darken(Colors.purple, 0.6)};
    } else if (state == "Completada") {
      return {'containerColor': Colors.green, 'textColor': darken(Colors.green, 0.6)};
    } else {
      return {'containerColor': Colors.grey, 'textColor': darken(Colors.grey, 0.6)};
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Color> colors = _getStateColors(state_text);

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colors['containerColor'], // Determina el color del contenedor
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state_text,
            style: TextStyle(
              fontSize: 16.0,
              color: colors['textColor'], // Usa el color más oscuro para el texto
              fontWeight: FontWeight.bold, // Poner el texto en negrita
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0), // Espacio entre los textos
          Text(
            'Estado actual de la tarea',
            style: TextStyle(
              fontSize: 12.0,
              color: colors['textColor'], // Usa el color más oscuro para el texto
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}