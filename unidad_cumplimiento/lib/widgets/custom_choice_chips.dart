import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/theme/color_theme.dart'; // Importa color_theme.dart

class CustomChoiceChips extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onSelected;
  final String selectedOption;

  const CustomChoiceChips({
    super.key,
    required this.options,
    required this.onSelected,
    required this.selectedOption,
  });

  @override
  _CustomChoiceChipsState createState() => _CustomChoiceChipsState();
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.map((option) {
        return ChoiceChip(
          label: Text(option),
          selected: widget.selectedOption == option,
          onSelected: (selected) {
            widget.onSelected(option);
          },
          selectedColor: ColorTheme.primaryColor, // Usa primaryColor cuando se selecciona
          labelStyle: TextStyle(
            color: widget.selectedOption == option ? ColorTheme.whiteColor : Colors.black,
          ), // Cambia el color del texto cuando se selecciona
          avatar: widget.selectedOption == option
              ? const Icon(
                  Icons.check,
                  color: ColorTheme.whiteColor,
                  size: 20.0, // Ajusta el tamaño del ícono para mayor contraste
                )
              : null, // Añade un ícono cuando se selecciona
        );
      }).toList(),
    );
  }
}

