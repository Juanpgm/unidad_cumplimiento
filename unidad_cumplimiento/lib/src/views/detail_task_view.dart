import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/secondary_appbar.dart'; // Importa secondary_appbar.dart
import 'package:unidad_cumplimiento/widgets/descripcion_expandible.dart'; // Importa descripcion_expandible.dart
import 'package:unidad_cumplimiento/widgets/task_fechas_container.dart'; // Importa task_fechas_container.dart
import 'package:unidad_cumplimiento/widgets/custom_drawer.dart'; // Importa custom_drawer.dart
import 'package:unidad_cumplimiento/widgets/task_meta_progressbar.dart'; // Importa task_meta_progressbar.dart
import 'package:unidad_cumplimiento/widgets/task_ejecucion_presupuestal_circleChart.dart'; // Importa task_ejecucion_presupuestal_circleChart.dart
import 'package:unidad_cumplimiento/widgets/task_fecha_analysis.dart'; // Importa task_fecha_analysis.dart
import 'package:unidad_cumplimiento/widgets/task_time_progressbar.dart'; // Importa task_time_progressbar.dart
import 'package:unidad_cumplimiento/widgets/task_personal_asigned_container.dart'; // Importa task_personal_asigned_container.dart
import 'package:unidad_cumplimiento/widgets/custom_add_button.dart'; // Importa custom_add_button.dart

class DetailTaskView extends StatelessWidget {
  final Map<String, dynamic> tarea;

  const DetailTaskView({super.key, required this.tarea});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Detecta si es una pantalla grande (tablet o web)
        bool isLargeScreen = constraints.maxWidth >= 768;

        return Scaffold(
          appBar: isLargeScreen
              ? null // No muestra AppBar en pantallas grandes
              : const SecondaryAppBar(
                  title: 'Detalle de la Tarea',
                ),
          drawer: isLargeScreen
              ? null // No muestra el drawer en pantallas grandes porque ya está visible
              : const CustomDrawer(),
          body: Row(
            children: [
              if (isLargeScreen)
                const CustomDrawer(), // Muestra el drawer por defecto en pantallas grandes
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tarea['TAREA_ACCION'] ?? 'Nombre de la Tarea',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Descripción de la tarea:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DescripcionExpandible(
                          descripcion: tarea['DESCRIPCION_TAREA_ACCION'] ?? 'Descripción no disponible',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2, // "Fechas de la tarea" ocupa más espacio
                              child: TaskFechasContainer(
                                fechaInicio: DateTime.parse(tarea['F_INICIO'] ?? '2000-01-01'),
                                fechaFin: DateTime.parse(tarea['F_FIN'] ?? '2000-01-01'),
                                fechaEntrega: DateTime.parse(tarea['F_ENTREGA'] ?? '2000-01-01'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 1, // "Progreso temporal" ocupa menos espacio
                              child: TaskFechaAnalysis(
                                fechaInicio: DateTime.parse(tarea['F_INICIO'] ?? '2000-01-01'),
                                fechaFin: DateTime.parse(tarea['F_FIN'] ?? '2000-01-01'),
                                fechaEntrega: DateTime.parse(tarea['F_ENTREGA'] ?? '2000-01-01'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Implementación de TaskTimeProgressBar
                        TaskTimeProgressBar(
                          diasTranscurridos: DateTime.now()
                              .difference(DateTime.parse(tarea['F_INICIO'] ?? '2000-01-01'))
                              .inDays,
                          duracionTarea: DateTime.parse(tarea['F_FIN'] ?? '2000-01-01')
                              .difference(DateTime.parse(tarea['F_INICIO'] ?? '2000-01-01'))
                              .inDays,
                        ),
                        const SizedBox(height: 16),
                        TaskMetaProgressBar(
                          unidadesEjecutadas: tarea['UNIDADES_EJECUTADAS'] ?? 0,
                          meta: tarea['META'] ?? 1,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TaskEjecucionPresupuestalCircleChart(
                                pptoEjecutado: tarea['PPTO_EJECUTADO'] ?? 0.0,
                                pptoAsignado: tarea['PPTO_ASIGNADO'] ?? 1.0,
                                unidadesEjecutadas: tarea['UNIDADES_EJECUTADAS'] ?? 0,
                                meta: tarea['META'] ?? 1,
                              ),
                            ),
                            const SizedBox(width: 8), // Espaciado mínimo según padding_defaults
                            Expanded(
                              flex: 1,
                              child: TaskPersonalAssignedContainer(
                                responsable: tarea['RESPONSABLE'] ?? {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Implementación del botón personalizado
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomAddButton(
                            onPressed: () {
                              // Acción al presionar el botón
                              print('Botón de actualizar presionado');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}