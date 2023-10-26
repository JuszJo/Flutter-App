import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:my_app/classes/bullet.dart';

class Spaceship {
  int width = 50;
  int height = 63;
  double x = 0;
  double y = 0;
  int speed = 2;
  double buffer = 0;
  double nextFrame = 30;
  // double nextFrame = 100;

  late Bullet bullet;

  void feedDx(double dx) {
    x += dx;
  }

  void drawShip(Canvas canvas, ui.Image img) {
    canvas.drawImage(img, Offset(x, y), Paint());
  }

  void detectWallCollision(Size size) {
    if(x + width > size.width) {
      x = size.width - width;
    }
    if(x < 0) {
      x = 0;
    }
  }

  void autoShoot() {
    if(buffer == nextFrame) {
      bullet.bullets.add([x + (width / 2) - (bullet.width / 2), y - 20]);

      buffer = 0;
    }

    ++buffer;
  }
}

class ShipPainter extends CustomPainter {
  ShipPainter({required this.image, required this.ship});

  final ui.Image image;

  final Spaceship ship;

  @override
  void paint(Canvas canvas, Size size) {
    ship.detectWallCollision(size);

    ship.drawShip(canvas, image);

    ship.autoShoot();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}