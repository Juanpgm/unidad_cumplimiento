import 'package:flutter/material.dart';

class FechaContainer extends StatelessWidget {
  final String texto;
  final DateTime fechaInicial;
  final bool editable; // Nueva propiedad

  const FechaContainer({
    super.key,
    required this.texto,
    required this.fechaInicial,
    this.editable = false, // Por defecto no editable
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ocupa todo el ancho disponible
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: editable ? Colors.blue : Colors.grey, // Cambia el color si es editable
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              texto,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '${fechaInicial.day}/${fechaInicial.month}/${fechaInicial.year}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: editable ? Colors.black : Colors.grey, // Cambia el color si es editable
                  ),
            ),
          ],
        ),
      ),
    );
  }
}