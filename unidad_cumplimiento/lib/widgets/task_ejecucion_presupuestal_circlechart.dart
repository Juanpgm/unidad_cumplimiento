import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskEjecucionPresupuestalCircleChart extends StatelessWidget {
  final double pptoEjecutado;
  final double pptoAsignado;
  final int unidadesEjecutadas;
  final int meta;

  const TaskEjecucionPresupuestalCircleChart({
    Key? key,
    required this.pptoEjecutado,
    required this.pptoAsignado,
    required this.unidadesEjecutadas,
    required this.meta,
  }) : super(key: key);

  // Método para obtener los colores según la diferencia entre los porcentajes
  Map<String, dynamic> _getColorsAndMessage(double porcentajeEjecucionPresupuestal, double porcentajeUnidades) {
    final double diferencia = (porcentajeEjecucionPresupuestal - porcentajeUnidades).abs();

    if (diferencia <= 5) {
      return {'color': Colors.green, 'message': null};
    } else if (diferencia > 5 && diferencia <= 10) {
      return {'color': Colors.blue, 'message': null};
    } else if (diferencia > 10 && diferencia <= 20) {
      return {'color': Colors.purple, 'message': null};
    } else {
      // Si la diferencia es mayor al 20% y el porcentaje de ejecución presupuestal es >= 100%
      if (diferencia > 20 && porcentajeEjecucionPresupuestal >= 100) {
        return {
          'color': Colors.red,
          'message': '¡Las tareas no se han completado y no te quedan recursos!',
        };
      }
      return {'color': Colors.red, 'message': null};
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calcula los porcentajes
    final double porcentajeEjecucionPresupuestal =
        pptoAsignado > 0 ? (pptoEjecutado / pptoAsignado * 100).clamp(0.0, 200.0) : 0.0;
    final double porcentajeUnidades =
        meta > 0 ? (unidadesEjecutadas / meta * 100).clamp(0.0, 200.0) : 0.0;

    // Obtiene el color y el mensaje según la lógica
    final colorsAndMessage = _getColorsAndMessage(porcentajeEjecucionPresupuestal, porcentajeUnidades);

    // Formatea los valores como moneda en pesos colombianos
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'es_CO', symbol: '\$ - COP');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Ejecución Presupuestal',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            height: 240,
            width: 240,
            child: CustomPaint(
              painter: _CircleChartPainter(
                porcentajeEjecucionPresupuestal / 100,
                colorsAndMessage['color'],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${porcentajeEjecucionPresupuestal.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorsAndMessage['color'],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ejecutado',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorsAndMessage['color'],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Presupuesto Ejecutado: ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: currencyFormat.format(pptoEjecutado),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorsAndMessage['color'],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Presupuesto Asignado: ${currencyFormat.format(pptoAsignado)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // Muestra el mensaje de alerta solo si el porcentaje es superior al 100% y hay un mensaje
              if (porcentajeEjecucionPresupuestal > 100 && colorsAndMessage['message'] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    colorsAndMessage['message'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CircleChartPainter extends CustomPainter {
  final double porcentaje;
  final Color progressColor;

  _CircleChartPainter(this.porcentaje, this.progressColor);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - 20;

    // Dibuja el fondo del círculo
    canvas.drawCircle(center, radius, backgroundPaint);

    // Dibuja el progreso
    final double sweepAngle = 2 * 3.141592653589793 * porcentaje;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}