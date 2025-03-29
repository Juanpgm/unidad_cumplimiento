import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/datos_usuario.dart';

class TaskSectorialistaContainer extends StatelessWidget {
  final Map<String, String> responsable;

  const TaskSectorialistaContainer({super.key, required this.responsable});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    // Filtra los usuarios para excluir al responsable
    final List<Map<String, String>> usuariosFiltrados = usuarios
        .where((usuario) => usuario['nombre'] != responsable['nombre'])
        .toList();

    // Selecciona un usuario aleatorio de los usuarios filtrados
    final Map<String, String> usuarioSeleccionado =
        usuariosFiltrados[random.nextInt(usuariosFiltrados.length)];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título dentro del contenedor
            Text(
              'Sectorialista',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            // Imagen del usuario
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(usuarioSeleccionado['userImagen']!),
                  radius: 30,
                ),
                const SizedBox(width: 16),
                // Nombre y estado
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usuarioSeleccionado['nombre']!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      usuarioSeleccionado['estado']!,
                      style: TextStyle(
                        color: usuarioSeleccionado['estado'] == 'Activo'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Profesión
            Text(
              'Profesión: ${usuarioSeleccionado['profesion']}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // Correo electrónico
            Text(
              'Correo: ${usuarioSeleccionado['correoElectronico']}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // Celular
            Text(
              'Celular: ${usuarioSeleccionado['celular']}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // Organismo
            Text(
              'Organismo: ${usuarioSeleccionado['organismo']}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}