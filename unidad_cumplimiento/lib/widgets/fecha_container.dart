import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart'; // Importa padding_defaults.dart

class FechaContainer extends StatefulWidget {
  final String texto;
  final DateTime fechaInicial;

  const FechaContainer({Key? key, required this.texto, required this.fechaInicial}) : super(key: key);

  @override
  _FechaContainerState createState() => _FechaContainerState();
}

class _FechaContainerState extends State<FechaContainer> {
  bool isExpanded = false;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.fechaInicial;
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: double.infinity,
            padding: PaddingDefaults.small, // Usa el padding pequeño
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              '${widget.texto}: $formattedDate',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        if (isExpanded)
          Container(
            width: double.infinity,
            padding: PaddingDefaults.small, // Usa el padding pequeño
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
      ],
    );
  }
}