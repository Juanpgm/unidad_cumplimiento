import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/main_appbar.dart';
import 'package:unidad_cumplimiento/widgets/custom_drawer.dart';
import 'package:unidad_cumplimiento/widgets/work_plan_list_view.dart';
import 'package:unidad_cumplimiento/widgets/custom_search_bar.dart'; // Importa custom_search_bar.dart
import 'package:unidad_cumplimiento/widgets/custom_choice_chips.dart'; // Importa custom_choice_chips.dart
import 'package:unidad_cumplimiento/widgets/custom_add_button.dart'; // Importa custom_add_button.dart
import 'package:unidad_cumplimiento/src/datos_proceso.dart'; // Importa datos_proceso.dart
import 'package:unidad_cumplimiento/src/theme/color_theme.dart'; // Importa color_theme.dart
import 'package:unidad_cumplimiento/widgets/create_process_dialog.dart'; // Importa el diálogo

void main() {
  runApp(const UnidadCumplimientoApp());
}

class UnidadCumplimientoApp extends StatelessWidget {
  const UnidadCumplimientoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid: false,
      home: WorkPlansScreen(),
    );
  }
}

class WorkPlansScreen extends StatefulWidget {
  const WorkPlansScreen({super.key});

  @override
  _WorkPlansScreenState createState() => _WorkPlansScreenState();
}

class _WorkPlansScreenState extends State<WorkPlansScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = '';
  String selectedFilter = 'Todos';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProcesos = procesos.where((proceso) {
      bool matchesSearchQuery = proceso['nombreProceso']
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      bool matchesFilter = selectedFilter == 'Todos' ||
          (selectedFilter == 'En Proceso' && proceso['estadoProceso'] == 'En Proceso') ||
          (selectedFilter == 'Críticos' && proceso['estadoProceso'] == 'Crítico') ||
          (selectedFilter == 'Completados' && proceso['estadoProceso'] == 'Completada');

      return matchesSearchQuery && matchesFilter;
    }).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 768; // Detecta pantallas grandes

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorTheme.backgroundColor, // Usa backgroundColor de color_theme.dart
          appBar: isLargeScreen
              ? null // No muestra AppBar en pantallas grandes
              : MainAppBar(
                  title: 'Procesos',
                  onMenuPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
          drawer: isLargeScreen
              ? null // No muestra el drawer en pantallas grandes porque ya está visible
              : const CustomDrawer(),
          body: Row(
            children: [
              if (isLargeScreen)
                const CustomDrawer(), // Muestra el drawer por defecto en pantallas grandes
              Expanded(
                child: Column(
                  children: [
                    CustomSearchBar(
                      hintText: 'Buscar procesos...',
                      onSearchChanged: (query) {
                        setState(() {
                          searchQuery = query;
                        });
                      },
                    ), // Usa el CustomSearchBar
                    CustomChoiceChips(
                      options: const ['Todos', 'Completados', 'En Proceso', 'Críticos'], // Define las opciones
                      selectedOption: selectedFilter,
                      onSelected: (filter) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ), // Añade CustomChoiceChips debajo de la barra de búsqueda
                    Expanded(
                      child: WorkPlanListView(procesos: filteredProcesos), // Usa la lista de procesos filtrados
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: CustomAddButton(
            onPressed: () async {
              // Mostrar el diálogo de creación de proceso
              final nuevoProceso = await showDialog(
                context: context,
                builder: (context) => const CreateProcessDialog(),
              );

              if (nuevoProceso != null) {
                setState(() {
                  // Agregar el nuevo proceso a la lista de procesos
                  procesos.add(nuevoProceso);
                });
                print('Nuevo proceso añadido: $nuevoProceso');
              }
            },
          ), // Añade el CustomAddButton en la esquina inferior derecha
        );
      },
    );
  }
}