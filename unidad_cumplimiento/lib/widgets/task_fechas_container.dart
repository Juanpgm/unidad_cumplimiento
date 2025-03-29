import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/fecha_container.dart';
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart';

class TaskFechasContainer extends StatefulWidget {
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final DateTime fechaEntrega;

  const TaskFechasContainer({
    super.key,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaEntrega,
  });

  @override
  _TaskFechasContainerState createState() => _TaskFechasContainerState();
}

class _TaskFechasContainerState extends State<TaskFechasContainer> {
  late DateTime _fechaInicio;
  late DateTime _fechaFin;
  late DateTime _fechaEntrega;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _fechaInicio = widget.fechaInicio;
    _fechaFin = widget.fechaFin;
    _fechaEntrega = widget.fechaEntrega;
  }

  Future<void> _selectDate(BuildContext context, DateTime initialDate, ValueChanged<DateTime> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Fechas de la tarea', style: Theme.of(context).textTheme.headlineSmall),
            IconButton(
              icon: Icon(_isEditing ? Icons.check : Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing; // Alterna entre modo de edición y no edición
                });
              },
            ),
          ],
        ),
        Padding(
          padding: PaddingDefaults.verySmall,
          child: GestureDetector(
            onTap: _isEditing
                ? () => _selectDate(context, _fechaInicio, (date) {
                    setState(() {
                      _fechaInicio = date;
                    });
                  })
                : null, // No permite interacción si no está en modo edición
            child: FechaContainer(
              texto: 'Fecha de inicio',
              fechaInicial: _fechaInicio,
              editable: _isEditing, // Propiedad para controlar si es editable
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: PaddingDefaults.verySmall,
          child: GestureDetector(
            onTap: _isEditing
                ? () => _selectDate(context, _fechaFin, (date) {
                    setState(() {
                      _fechaFin = date;
                    });
                  })
                : null, // No permite interacción si no está en modo edición
            child: FechaContainer(
              texto: 'Fecha de fin',
              fechaInicial: _fechaFin,
              editable: _isEditing, // Propiedad para controlar si es editable
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: PaddingDefaults.verySmall,
          child: GestureDetector(
            onTap: _isEditing
                ? () => _selectDate(context, _fechaEntrega, (date) {
                    setState(() {
                      _fechaEntrega = date;
                    });
                  })
                : null, // No permite interacción si no está en modo edición
            child: FechaContainer(
              texto: 'Fecha de entrega',
              fechaInicial: _fechaEntrega,
              editable: _isEditing, // Propiedad para controlar si es editable
            ),
          ),
        ),
      ],
    );
  }
}