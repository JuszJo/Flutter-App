import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Spaceship {
  int width = 50;
  int height = 63;
  double x = 0;
  double y = 0;

  int speed = 2;

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
}

class ShipPainter extends CustomPainter {
  ShipPainter({required this.image, required this.ship});

  final ui.Image image;

  final Spaceship ship;

  @override
  void paint(Canvas canvas, Size size) {
    ship.detectWallCollision(size);

    ship.drawShip(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}