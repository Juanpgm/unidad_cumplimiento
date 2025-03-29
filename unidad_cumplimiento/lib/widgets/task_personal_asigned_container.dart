import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/task_responsable_container.dart';
import 'package:unidad_cumplimiento/widgets/task_sectorialista_container.dart';

class TaskPersonalAssignedContainer extends StatelessWidget {
  final Map<String, String> responsable;

  const TaskPersonalAssignedContainer({super.key, required this.responsable});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450), // Limita el ancho máximo a 650
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contenedor del responsable
          TaskResponsableContainer(),
          const SizedBox(height: 16),
          // Contenedor del sectorialista
          TaskSectorialistaContainer(responsable: responsable),
        ],
      ),
    );
  }
}