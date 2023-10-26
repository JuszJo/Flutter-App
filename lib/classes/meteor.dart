import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:my_app/utils/utils.dart';

class Meteor {
  double x = 100;
  double y = 0;
  double width = 96;
  double height = 96;
  double speed = 3;
  List<List> meteors = [[randomLocation(), 0.toDouble()]];
  double buffer = 0;
  double nextFrame = 50;
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

  void drawMeteor(Canvas canvas, image) {
    if(meteors.isNotEmpty) {
      for(int i = 0; i < meteors.length; ++i) {
        canvas.drawImage(image, Offset(meteors[i][0], meteors[i][1]), Paint());

        Paint paint = Paint();

        paint.style = PaintingStyle.stroke;

        Rect border = Rect.fromLTWH(meteors[i][0] + 25, meteors[i][1] + 30, width - 50, height - 60);

        canvas.drawRect(border, paint);

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
    if(meteor.meteors.length > 10) {
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