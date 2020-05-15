import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;
import 'dart:math';
import 'package:worldclock/constants/constants.dart';

class CurrentTimeClockHands extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var angle = Vector.radians(90);
    canvas.rotate(angle);
    final paint = Paint()..strokeCap = StrokeCap.round;
    var center = Offset((size.width / 2), (size.height / 2));

    final secondsP1 = center;
    double secondsDegree = 360 / 60 * DateTime.now().second;
    double x = (size.width / 1) +
        (size.width / 1 - 110) * cos(Vector.radians(secondsDegree));
    double y = (size.width / 1) +
        (size.width / 1 - 110) * sin(Vector.radians(secondsDegree));

    final secondsP2 = Offset(x, y);
    paint.color = Color(red);
    paint.strokeWidth = 4;
    canvas.drawLine(secondsP1, secondsP2, paint);

    final minutesP1 = center;
    double minutesDegree = 360 / 60 * DateTime.now().minute;
    x = (size.width / 1) +
        (size.width / 1 - 80) * cos(Vector.radians(minutesDegree));
    y = (size.width / 1) +
        (size.width / 1 - 80) * sin(Vector.radians(minutesDegree));

    final minutesP2 = Offset(x, y);
    paint.color = Color(purple);
    paint.strokeWidth = 4;
    canvas.drawLine(minutesP1, minutesP2, paint);

    final hoursP1 = center;
    double hoursDegree = 360 / 12 * (DateTime.now().hour - 12);
    x = (size.width / 2) +
        (size.width / 3 - 50) * cos(Vector.radians(hoursDegree));
    y = (size.width / 2) +
        (size.width / 3 - 50) * sin(Vector.radians(hoursDegree));

    final hoursP2 = Offset(x, y);
    paint.color = Color(yellow);
    paint.strokeWidth = 4;
    canvas.drawLine(hoursP1, hoursP2, paint);

    //External Lines

    for (int i = 0; i < 60; i++) {
      //line position
      double minute = 360 / 60 * i;

      //style every 5 minute
      paint.color = (i % 15 == 0) ? Colors.grey : Colors.white;
      paint.strokeWidth = (i % 15 == 0) ? 4 : 1;

      double x1 = (size.width / 2) +
          (size.width / 3 + 118) * cos(Vector.radians(minute));
      double y1 = (size.height / 2) +
          (size.width / 3 + 118) * sin(Vector.radians(minute));

      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) +
          (size.width / 3 + 123) * cos(Vector.radians(minute));
      double y2 = (size.height / 2) +
          (size.width / 3 + 123) * sin(Vector.radians(minute));

      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
