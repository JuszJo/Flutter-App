import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Bullet {
  double x = 0;
  double y = 0;
  double width = 10;
  double height = 15;
  double speed = 10;
  bool shot = false;
  bool moving = false;
  List bullets = [];

  void paintBullets(Canvas canvas, ui.Image image) {
    if(bullets.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        canvas.drawImage(image, Offset(bullets[i][0], bullets[i][1]), Paint());

        Paint paint = Paint();

        paint.style = PaintingStyle.stroke;

        Rect border = Rect.fromLTWH(bullets[i][0], bullets[i][1], width, height);

        canvas.drawRect(border, paint);

        moveBullets(bullets[i]);
      }
    }
  }

  void moveBullets(List bullet) {
    bullet[1] -= speed;
  }
}

class BulletPainter extends CustomPainter {
  BulletPainter({required this.image, required this.bullet});

  final ui.Image image;
  final Bullet bullet;

  @override
  void paint(Canvas canvas, Size size) {
    if(bullet.bullets.length > 10) {
      bullet.bullets.removeAt(0);
    }

    bullet.paintBullets(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}