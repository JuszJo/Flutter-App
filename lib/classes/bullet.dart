import 'dart:ui';

import 'package:flutter/material.dart';

class Bullet {
  double x = 0;
  double y = 0;
  double width = 10;
  double height = 15;
  double speed = 5;
  bool shot = false;
  bool moving = false;
  List bullets = [];

  void paintBullets(Canvas canvas) {
    if(bullets.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        Rect bulletRect = Rect.fromLTWH(bullets[i][0], bullets[i][1], width, height);

        canvas.drawRect(bulletRect, Paint());

        bullets[i][1] -= speed;
      }
    }
  }
}

class BulletPainter extends CustomPainter {
  BulletPainter({required this.bullet});

  final Bullet bullet;

  @override
  void paint(Canvas canvas, Size size) {
    bullet.paintBullets(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}