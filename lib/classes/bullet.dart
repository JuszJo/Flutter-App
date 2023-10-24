import 'dart:ui' as ui;

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

  void paintBullets(Canvas canvas, ui.Image image) {
    if(bullets.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        canvas.drawImage(image, Offset(bullets[i][0], bullets[i][1]), Paint());

        bullets[i][1] -= speed;
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
    bullet.paintBullets(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}