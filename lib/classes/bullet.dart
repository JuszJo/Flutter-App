import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Bullet {
  double x = 0;
  double y = 0;
  double width = 10;
  double height = 28;
  double speed = 5;
  // double speed = 3;
  bool shot = false;
  bool moving = false;
  List bullets = [];

  void showBorder(Canvas canvas, List bullet) {
    Paint paint = Paint();

    paint.style = PaintingStyle.stroke;

    Rect border = Rect.fromLTWH(bullet[0], bullet[1], width, height);

    canvas.drawRect(border, paint);
  }

  void paintBullets(Canvas canvas, ui.Image image) {
    if(bullets.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        canvas.drawImage(image, Offset(bullets[i][0], bullets[i][1]), Paint());

        // showBorder(canvas, bullets[i]);

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
    if(bullet.bullets.length > 5) {
      bullet.bullets.removeAt(0);
    }

    bullet.paintBullets(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}