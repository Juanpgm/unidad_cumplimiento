import 'package:flutter/material.dart';
import 'color_theme.dart';

class TextStyles {
  // Estilos de texto para encabezados
  static const TextStyle header1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: ColorTheme.textColor,
  );

  static const TextStyle header2 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: ColorTheme.textColor,
  );

  static const TextStyle header3 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: ColorTheme.textColor,
  );

  // Estilos de texto para subtítulos
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: ColorTheme.textColor,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: ColorTheme.textColor,
  );

  static const TextStyle subtitle3= TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: ColorTheme.textColor,
  );

  // Estilos de texto para cuerpo de texto
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: ColorTheme.textColor,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: ColorTheme.textColor,
  );

  static const TextStyle bodyText3 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: ColorTheme.textColor,
  );

  // Estilos de texto para botones
  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: ColorTheme.whiteColor,
  );

  // Estilos de texto para etiquetas
  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: ColorTheme.textColor,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
    color: ColorTheme.textColor,
  );
}