import 'dart:math';
import 'package:unidad_cumplimiento/src/datos_usuario.dart';

final Random random = Random();

final List<String> segmentos = [
  'Gerencia de Ciudad',
  'Gerencia Social',
  'Empréstito',
  'Presupuesto Participativo'
];

final List<String> tipoTarea = [
  'Gestión Operativa',
  'Gestión Administrativa',
  'Gestión Presupuestal',
  'Gestión Técnica',
  'Gestión Gerencial',
  'Gestión Contractual'
];

final List<String> estadosTareas = [
  'Registrada',
  'En Ejecución',
  'Pausada',
  'Completada'
];

final List<String> unidadesMeta = [
  'UND',
  'm',
  'm2',
  'm3',
  'Km',
  'Kg',
  'Viajes',
  'Horas',
  'Días',
  'Meses',
  'Personas'
];

final List<String> organismos = [
  'Secretaría de Gobierno',
  'Departamento Administrativo de Gestión Jurídica Pública',
  'Departamento Administrativo de Control Interno',
  'Departamento Administrativo de Control Disciplinario Interno',
  'Departamento Administrativo de Hacienda - DAH',
  'Departamento Administrativo de Planeación Municipal - DAPM',
  'Departamento Administrativo de Gestión del Medio Ambiente - DAGMA',
  'Departamento Administrativo de Tecnologías de la Información y las Comunicaciones - DATIC',
  'Departamento Administrativo de Contratación Pública - DACP',
  'Departamento Administrativo de Desarrollo e Innovación Institucional - DADII',
  'Secretaría de Educación',
  'Secretaría de Salud Pública',
  'Secretaría de Bienestar Social',
  'Secretaría de Vivienda Social y Hábitat',
  'Secretaría de Cultura',
  'Secretaría de Infraestructura',
  'Secretaría de Movilidad',
  'Secretaría de Seguridad y Justicia',
  'Secretaría del Deporte y la Recreación',
  'Secretaría de Gestión del Riesgo de Emergencias y Desastres',
  'Secretaría de Paz y Cultura Ciudadana',
  'Secretaría de Desarrollo Económico',
  'Secretaría de Turismo',
  'Secretaría de Desarrollo Territorial y Participación Ciudadana',
  'Unidad Administrativa Especial de Gestión de Bienes y Servicios - UAEGS',
  'Unidad Administrativa Especial de Servicios Públicos - UAESPM',
  'Unidad Administrativa Especial de Protección Animal - UAEPA',
  'Estudio de Grabación Takeshima',
  'Teatro Municipal',
  'EMCALI',
  'METROCALI',
  'Equipo Gerencia de Ciudad',
  'GRECOCENTRO',
  'Empresa de Desarrollo y Renovación Urbana - EDRU',
  'SENA'
];

final List<String> comunas = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  'Todas',
];

DateTime getRandomDateAfter(DateTime startDate) {
  return startDate.add(Duration(days: random.nextInt(365)));
}

final List<Map<String, dynamic>> procesos = List.generate(10, (index) {
  DateTime fInicio = DateTime(2020 + random.nextInt(5), random.nextInt(12) + 1, random.nextInt(28) + 1);
  DateTime fFin = getRandomDateAfter(fInicio);
  DateTime fEntrega = getRandomDateAfter(fFin);
  int meta = random.nextInt(250) + 1;
  int unidadesEjecutadas = random.nextInt(meta + 1);

  return {
    'nombreProceso': 'Proceso ${index + 1}',
    'userImagen': usuarios[index % usuarios.length]['userImagen']!,
    'estadoProceso': estadosTareas[random.nextInt(estadosTareas.length)],
    'nombreUsuario': usuarios[index % usuarios.length]['nombre']!,
    'tareasRegistradas': random.nextInt(100) + 1,
    'tareasCompletadas': random.nextInt(100) + 1,
    'segmento': segmentos[index % segmentos.length],
    'tareas': List.generate(5, (taskIndex) {
      return {
        'BP': random.nextInt(9000000) + 1000000,
        'TIPO_ACCION': tipoTarea[(index + taskIndex) % tipoTarea.length],
        'ORGANISMO': organismos[(index + taskIndex) % organismos.length],
        'TAREA_ACCION': 'Tarea ${taskIndex + 1} del Proceso ${index + 1}',
        'DESCRIPCION_TAREA_ACCION': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'ESTADO': estadosTareas[(index + taskIndex) % estadosTareas.length],
        'COMUNA': comunas[(index + taskIndex) % comunas.length],
        'BARRIO': 'BARRIO ${taskIndex + 1}',
        'DIRECCIÓN': 'Calle ${random.nextInt(100) + 1} #${random.nextInt(100) + 1}-${random.nextInt(100) + 1}',
        'COORD_Lat': 3.4 + random.nextDouble() * 0.1,
        'COORD_Long': -76.5 + random.nextDouble() * 0.1,
        'CENTRO_GRAVEDAD': random.nextBool() ? 'V' : 'F',
        'META': meta,
        'UNIDAD_META': unidadesMeta[(index + taskIndex) % unidadesMeta.length],
        'UNIDADES_EJECUTADAS': unidadesEjecutadas,
        'PPTO_ASIGNADO': random.nextDouble() * 100000000,
        'PPTO_EJECUTADO': random.nextDouble() * 100000000,
        'IMPACTO': random.nextInt(3000000) + 1,
        'EMPLEOS': random.nextInt(1000) + 1,
        'F_INICIO': fInicio.toIso8601String(),
        'F_FIN': fFin.toIso8601String(),
        'F_ENTREGA': fEntrega.toIso8601String(),
        'RESPONSABLE_ORGANISMO': usuarios[random.nextInt(usuarios.length)]['nombre']!,
        'SECTORIALISTA': usuarios[random.nextInt(usuarios.length)]['nombre']!,
        'REGISTRADO_POR': usuarios[random.nextInt(usuarios.length)]['nombre']!,
      };
    }),
  };
});