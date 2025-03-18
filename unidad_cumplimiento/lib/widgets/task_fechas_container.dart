import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/fecha_container.dart'; // Importa fecha_container.dart
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart'; // Importa padding_defaults.dart

class TaskFechasContainer extends StatelessWidget {
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final DateTime fechaEntrega;

  const TaskFechasContainer({
    Key? key,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaEntrega,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: PaddingDefaults.verySmall,
          child: FechaContainer(
            texto: 'Fecha de inicio',
            fechaInicial: fechaInicio,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: PaddingDefaults.verySmall,
          child: FechaContainer(
            texto: 'Fecha de fin',
            fechaInicial: fechaFin,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: PaddingDefaults.verySmall,
          child: FechaContainer(
            texto: 'Fecha de entrega',
            fechaInicial: fechaEntrega,
          ),
        ),
      ],
    );
  }
}