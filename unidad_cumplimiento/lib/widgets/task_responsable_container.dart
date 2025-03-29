import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/datos_usuario.dart';

class TaskResponsableContainer extends StatelessWidget {
  const TaskResponsableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    // Selecciona un usuario aleatorio de la lista
    final Map<String, String> usuarioSeleccionado =
        usuarios[random.nextInt(usuarios.length)];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título dentro del contenedor
            Text(
              'Representante del organismo',
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