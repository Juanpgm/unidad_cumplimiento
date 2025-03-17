import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/theme/color_theme.dart'; // Importa color_theme.dart
import 'package:unidad_cumplimiento/src/views/work_plans.dart'; // Importa work_plans.dart

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorTheme.primaryColor, // Usa primaryColor de color_theme.dart
            ),
            child: const Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Vista General'),
            onTap: () {
              // Acción al seleccionar "Vista General"
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Procesos'),
            onTap: () {
              // Navegar a la vista de work_plans.dart
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WorkPlansScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Proyectos/Programas'),
            onTap: () {
              // Acción al seleccionar "Proyectos/Programas"
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              // Acción al seleccionar "Perfil"
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Salir'),
            onTap: () {
              // Acción al seleccionar "Salir"
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}