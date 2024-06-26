import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  DateTime dateTime = DateTime.now();

  //60 sekund - 360, 1 sekund - 6 daraja
  //12 soat  - 360, 1 soat - 30 daraja, 1 minuurt - 0.5 daraja

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    Paint fillPaint = Paint()..color = Colors.black;

    Paint outlinePaint = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    Paint centerFillPaint = Paint()..color = const Color(0xFFEAECFF);

    Paint secondPaint = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    Paint minutPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFF748EF6),
          Color(0xFF77DDFF),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    Paint hourPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFEA74AB),
          Color(0xFFC279FB),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    Paint dashPaint = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    Paint numbersPaint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - 40, fillPaint);
    canvas.drawCircle(center, radius - 40, outlinePaint);
    // canvas.drawRect(
    // Rect.fromCenter(center: center, width: 100, height: 100), outlinePaint);

    double secondX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    double secondY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondX, secondY), secondPaint);

    double minutX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    double minutY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minutX, minutY), minutPaint);

    double hourX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hourX, hourY), hourPaint);
    canvas.drawCircle(center, 10, centerFillPaint);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 10;
    for (var i = 0; i < 360; i += 10) {
      double x = centerX + outerCircleRadius * cos(i * pi / 180);
      double y = centerX + outerCircleRadius * sin(i * pi / 180);

      double x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      double y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x, y), Offset(x2, y2), dashPaint);
    }

    var outerCircleRadiusNumber = radius + 10;
    var innerCircleRadiusNumber = radius - 20;
    for (var i = 0; i < 360; i += 30) {
      double x = centerX + outerCircleRadiusNumber * cos(i * pi / 180);
      double y = centerX + outerCircleRadiusNumber * sin(i * pi / 180);

      double x2 = centerX + innerCircleRadiusNumber * cos(i * pi / 180);
      double y2 = centerX + innerCircleRadiusNumber * sin(i * pi / 180);
      canvas.drawLine(Offset(x, y), Offset(x2, y2), numbersPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
