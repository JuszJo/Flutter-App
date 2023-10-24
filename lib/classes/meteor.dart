import 'package:flutter/material.dart';

class Meteor {
  double x = 100;
  double y = 0;
  double width = 30;
  double height = 30;

  void drawMeteor(Canvas canvas) {
    Rect rect = Rect.fromLTWH(x, y, width, height);

    canvas.drawRect(rect, Paint());
  }
}

class MeteorPainter extends CustomPainter {
  Meteor meteor = Meteor();

  @override
  void paint(Canvas canvas, Size size) {
    meteor.drawMeteor(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}