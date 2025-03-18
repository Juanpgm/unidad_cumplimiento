import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/views/detail_task_view.dart'; // Importa detail_task_view.dart
import 'package:unidad_cumplimiento/src/theme/text_styles.dart'; // Importa text_styles.dart
import 'package:unidad_cumplimiento/widgets/task_meta_container.dart'; // Importa task_meta_container.dart
import 'package:unidad_cumplimiento/widgets/task_ejecucion_presupuesto.dart'; // Importa task_ejecucion_presupuesto.dart
import 'package:unidad_cumplimiento/widgets/task_estado_container.dart'; // Importa task_state_container.dart
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart'; // Importa paddingDefaults.dart

class TaskContainer extends StatelessWidget {
  final Map<String, dynamic> tarea;

  const TaskContainer({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTaskView(tarea: tarea),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: PaddingDefaults.medium, // Aplica el padding uniforme
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tarea['TAREA_ACCION'],
                    style: TextStyles.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'BP: ',
                          style: TextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '${tarea['BP']}',
                          style: TextStyles.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tipo de Acción: ',
                          style: TextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '${tarea['TIPO_ACCION']}',
                          style: TextStyles.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Organismo: ',
                          style: TextStyles.bodyText3.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '${tarea['ORGANISMO']}',
                          style: TextStyles.bodyText3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0), // Espacio entre los bloques
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Comuna: ',
                                style: TextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${tarea['COMUNA']}',
                                style: TextStyles.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Registrado por: ',
                                style: TextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${tarea['REGISTRADO_POR']}',
                                style: TextStyles.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0), // Espacio entre los bloques
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100, // Ajusta la altura según sea necesario
                      child: TaskMetaContainer(
                        meta: tarea['META'],
                        unidadesEjecutadas: tarea['UNIDADES_EJECUTADAS'],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Espacio entre los contenedores
                  Expanded(
                    child: SizedBox(
                      height: 100, // Ajusta la altura según sea necesario
                      child: TaskEjecucionPresupuesto(
                        pptoAsignado: tarea['PPTO_ASIGNADO'],
                        pptoEjecutado: tarea['PPTO_EJECUTADO'],
                        containerColor: Colors.green, // Puedes ajustar el color según sea necesario
                        textColor: Colors.white, // Puedes ajustar el color del texto según sea necesario
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Espacio entre los contenedores
                  Expanded(
                    child: SizedBox(
                      height: 100, // Ajusta la altura según sea necesario
                      child: TaskEstadoContainer(
                        state_text: tarea['ESTADO'],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}