import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/widgets/main_appbar.dart';
import 'package:unidad_cumplimiento/widgets/custom_drawer.dart';
import 'package:unidad_cumplimiento/widgets/work_plan_list_view.dart';
import 'package:unidad_cumplimiento/widgets/custom_search_bar.dart'; // Importa custom_search_bar.dart
import 'package:unidad_cumplimiento/widgets/custom_choice_chips.dart'; // Importa custom_choice_chips.dart
import 'package:unidad_cumplimiento/widgets/custom_add_button.dart'; // Importa custom_add_button.dart
import 'package:unidad_cumplimiento/src/datos_proceso.dart'; // Importa datos_proceso.dart
import 'package:unidad_cumplimiento/src/theme/color_theme.dart'; // Importa color_theme.dart

void main() {
  runApp(const UnidadCumplimientoApp());
}

class UnidadCumplimientoApp extends StatelessWidget {
  const UnidadCumplimientoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: const WorkPlansScreen(),
    );
  }
}

class WorkPlansScreen extends StatefulWidget {
  const WorkPlansScreen({Key? key}) : super(key: key);

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorTheme.backgroundColor, // Usa backgroundColor de color_theme.dart
      appBar: MainAppBar(
        title: 'Procesos',
        onMenuPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
      body: Column(
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
            options: ['Todos', 'Completados', 'En Proceso', 'Críticos'], // Define las opciones
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
      floatingActionButton: CustomAddButton(
        onPressed: () {
          // Acción al presionar el botón
          print('Add button pressed');
        },
      ), // Añade el CustomAddButton en la esquina inferior derecha
    );
  }
}