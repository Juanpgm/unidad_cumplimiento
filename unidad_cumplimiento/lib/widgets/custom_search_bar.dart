import 'package:flutter/material.dart';
import 'package:unidad_cumplimiento/src/theme/padding_defaults.dart'; // Importa padding_defaults.dart

class CustomSearchBar extends StatelessWidget {
  final String hintText;

  const CustomSearchBar({Key? key, required this.hintText, required Null Function(dynamic query) onSearchChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: PaddingDefaults.horizontalMedium.left,
        right: PaddingDefaults.horizontalMedium.right,
        top: PaddingDefaults.topMedium.top,
        bottom: PaddingDefaults.topMedium.top,
      ), // Combina los paddings
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: PaddingDefaults.small, // Usa el padding pequeño
        ),
      ),
    );
  }
}