import 'package:flutter/material.dart';
import '../src/datos_proceso.dart'; // Asegúrate de que la ruta sea correcta

class CreateProcessDialog extends StatefulWidget {
  const CreateProcessDialog({super.key});

  @override
  _CreateProcessDialogState createState() => _CreateProcessDialogState();
}

class _CreateProcessDialogState extends State<CreateProcessDialog> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos del formulario
  final TextEditingController _nombreProcesoController = TextEditingController();
  final TextEditingController _estadoProcesoController = TextEditingController();

  // Variables para almacenar las selecciones de los Dropdowns
  String? _selectedSegmento;
  String? _selectedOrganismo;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallWidth = constraints.maxWidth < 314;

        return AlertDialog(
          title: const Text('Creación de proceso'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo: Nombre del proceso
                  TextFormField(
                    controller: _nombreProcesoController,
                    decoration: const InputDecoration(labelText: 'Nombre del proceso'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el nombre del proceso';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo: Estado del proceso
                  TextFormField(
                    controller: _estadoProcesoController,
                    decoration: const InputDecoration(labelText: 'Estado del proceso'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el estado del proceso';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo: Segmento (Dropdown)
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      value: _selectedSegmento,
                      decoration: const InputDecoration(labelText: 'Segmento'),
                      items: segmentos.map((segmento) {
                        return DropdownMenuItem(
                          value: segmento,
                          child: Text(
                            segmento,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: isSmallWidth ? 12 : 14), // Ajusta el tamaño del texto
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSegmento = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, seleccione un segmento';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo: Organismo (Dropdown)
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      value: _selectedOrganismo,
                      decoration: const InputDecoration(labelText: 'Organismo'),
                      items: organismos.map((organismo) {
                        return DropdownMenuItem(
                          value: organismo,
                          child: Text(
                            organismo,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: isSmallWidth ? 12 : 14), // Ajusta el tamaño del texto
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedOrganismo = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, seleccione un organismo';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Verifica que los valores seleccionados no sean null
                  if (_selectedSegmento == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, seleccione un segmento')),
                    );
                    return;
                  }

                  if (_selectedOrganismo == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, seleccione un organismo')),
                    );
                    return;
                  }

                  // Aquí puedes manejar los datos ingresados
                  final nuevoProceso = {
                    'nombreProceso': _nombreProcesoController.text,
                    'estadoProceso': _estadoProcesoController.text,
                    'segmento': _selectedSegmento,
                    'organismo': _selectedOrganismo,
                  };

                  print('Nuevo proceso creado: $nuevoProceso');
                  Navigator.of(context).pop(nuevoProceso); // Devuelve los datos
                }
              },
              child: const Text('Crear'),
            ),
          ],
        );
      },
    );
  }
}