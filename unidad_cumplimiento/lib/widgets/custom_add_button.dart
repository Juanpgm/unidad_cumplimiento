import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/theme/color_theme.dart'; // Importa color_theme.dart

class CustomAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double elevation;

  const CustomAddButton({Key? key, required this.onPressed, this.elevation = 6.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: const CircleBorder(),
      color: ColorTheme.secondaryColor, // Usa secondaryColor como color de relleno
      child: IconButton(
        icon: const Icon(Icons.add),
        color: ColorTheme.whiteColor, // Usa whiteColor para el ícono
        onPressed: onPressed,
        iconSize: 30.0, // Ajusta el tamaño del ícono
        constraints: const BoxConstraints(
          minWidth: 56.0 * 1.15, // Incrementa el tamaño del botón en un 15%
          minHeight: 56.0 * 1.15, // Incrementa el tamaño del botón en un 15%
        ),
        padding: EdgeInsets.all(16.0 * 1.15), // Ajusta el padding para mantener el ícono centrado
      ),
    );
  }
}