import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:my_app/utils/utils.dart';

class Meteor {
  double x = 100;
  double y = 0;
  double width = 40;
  double height = 36;
  double speed = 3;
  // double speed = 0.5;
  List<List> meteors = [[randomLocation(), 0.toDouble()]];
  double buffer = 0;
  double nextFrame = 40;
  // double nextFrame = 100;
  Map<String, int> hitboxOffset = {
    "x": 25,
    "y": 30,
    "width": -50,
    "height": -60,
  };

  void spawnMeteor() {
    if(buffer == nextFrame) {
      meteors.add([randomLocation(), y]);

      buffer = 0;
    }

    ++buffer;
  }

  void showBorder(Canvas canvas, List meteor) {
    Paint paint = Paint();

    paint.style = PaintingStyle.stroke;

    Rect border = Rect.fromLTWH(meteor[0], meteor[1], width, height);

    canvas.drawRect(border, paint);
  }

  void drawMeteor(Canvas canvas, image) {
    if(meteors.isNotEmpty) {
      for(int i = 0; i < meteors.length; ++i) {
        canvas.drawImage(image, Offset(meteors[i][0], meteors[i][1]), Paint());

        // Rect border = Rect.fromLTWH(meteors[i][0] + 25, meteors[i][1] + 30, width - 50, height - 60);

        // showBorder(canvas, meteors[i]);

        moveMeteor(meteors[i]);
      }
    }
  }

  void moveMeteor(List meteors) {
    meteors[1] += speed;
  }
}

class MeteorPainter extends CustomPainter {
  MeteorPainter({required this.image, required this.meteor});

  ui.Image image;

  Meteor meteor;

  @override
  void paint(Canvas canvas, Size size) {
    if(meteor.meteors.length > 5) {
      meteor.meteors.removeAt(0);
    }

    meteor.spawnMeteor();

    meteor.drawMeteor(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}