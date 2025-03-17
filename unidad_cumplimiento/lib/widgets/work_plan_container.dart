import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/theme/color_theme.dart';
import 'package:unidad_cumplimiento/src/theme/text_styles.dart';
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart'; // Importa padding_defaults.dart
import 'package:unidad_cumplimiento/src/views/tasks_view.dart'; // Importa tasks_view.dart

class ProcesoWidget extends StatefulWidget {
  final String nombreProceso;
  final String userImagen;
  final int tareasCompletadas;
  final int tareasRegistradas;
  final String nombreUsuario;
  final String segmento; // Añade el parámetro segmento

  const ProcesoWidget({
    Key? key,
    required this.nombreProceso,
    required this.userImagen,
    required this.tareasCompletadas,
    required this.tareasRegistradas,
    required this.nombreUsuario,
    required this.segmento, // Añade el parámetro segmento
  }) : super(key: key);

  @override
  _ProcesoWidgetState createState() => _ProcesoWidgetState();
}

class _ProcesoWidgetState extends State<ProcesoWidget> {
  late String estadoProceso;
  bool _showNombreUsuario = false;

  void _showNombreUsuarioTemporarily() {
    setState(() {
      _showNombreUsuario = true;
    });
  }

  void _hideNombreUsuario() {
    setState(() {
      _showNombreUsuario = false;
    });
  }

  Color _getContainerColor() {
    double ratio = widget.tareasCompletadas / widget.tareasRegistradas;
    if (ratio < 0.30) {
      estadoProceso = 'Crítico';
      return Colors.red;
    } else if (ratio <= 0.50) {
      estadoProceso = 'En Proceso';
      return Colors.orange;
    } else if (ratio <= 0.75) {
      estadoProceso = 'En Proceso';
      return Colors.yellow;
    } else if (ratio <= 0.99) {
      estadoProceso = 'En Proceso';
      return Colors.blue;
    } else {
      estadoProceso = 'Completada';
      return Colors.green;
    }
  }

  Color _getDarkerColor(Color color) {
    const double factor = 0.35;
    return Color.fromARGB(
      color.alpha,
      (color.red * factor).round(),
      (color.green * factor).round(),
      (color.blue * factor).round(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = _getContainerColor();
    Color textColor = _getDarkerColor(containerColor);

    return Padding(
      padding: PaddingDefaults.verySmall, // Usa el padding verySmall alrededor del widget
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TasksView(nombreProceso: widget.nombreProceso)),
          );
        },
        child: Container(
          padding: PaddingDefaults.small, // Usa el padding pequeño dentro del contenedor
          color: ColorTheme.accentColor, // Establece el color de fondo del contenedor principal
          child: Row(
            children: [
              // Contenedor para el nombre del proceso
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nombreProceso,
                      style: TextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold), // Texto en negrita
                    ),
                    Text(
                      widget.segmento, // Muestra el segmento debajo del nombre del proceso
                      style: TextStyles.bodyText2.copyWith(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              // Contenedor para la imagen de la persona a cargo
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTapDown: (_) => _showNombreUsuarioTemporarily(),
                  onTapUp: (_) => _hideNombreUsuario(),
                  onTapCancel: _hideNombreUsuario,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        margin: PaddingDefaults.horizontalSmall, // Usa el padding horizontal pequeño
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(widget.userImagen),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (_showNombreUsuario)
                        Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Text(
                            widget.nombreUsuario,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Contenedor para las tareas completadas / tareas registradas
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksView(nombreProceso: widget.nombreProceso)),
                    );
                  },
                  child: Container(
                    padding: PaddingDefaults.small, // Usa el padding pequeño
                    decoration: BoxDecoration(
                      color: containerColor, // Determina el color del contenedor
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.tareasCompletadas} / ${widget.tareasRegistradas}',
                          style: TextStyle(
                            color: textColor, // Usa el color más oscuro para el texto
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          estadoProceso,
                          style: TextStyle(
                            color: textColor, // Usa el color más oscuro para el texto
                            fontSize: 12.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}