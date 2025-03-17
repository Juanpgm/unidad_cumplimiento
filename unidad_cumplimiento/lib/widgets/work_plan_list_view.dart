import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/work_plan_container.dart';
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart'; // Importa padding_defaults.dart

class WorkPlanListView extends StatelessWidget {
  final List<Map<String, dynamic>> procesos;

  const WorkPlanListView({Key? key, required this.procesos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingDefaults.horizontalMedium, // Usa el padding horizontal medio
      child: ListView.builder(
        itemCount: procesos.length,
        itemBuilder: (context, index) {
          final proceso = procesos[index];
          return ProcesoWidget(
            nombreProceso: proceso['nombreProceso']!,
            userImagen: proceso['userImagen']!,
            tareasCompletadas: proceso['tareasCompletadas']!,
            tareasRegistradas: proceso['tareasRegistradas']!,
            nombreUsuario: proceso['nombreUsuario']!,
            segmento: proceso['segmento']!,
          );
        },
      ),
    );
  }
}