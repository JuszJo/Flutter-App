import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Spaceship {
  int width = 50;
  int height = 63;
  double x = 0;
  double y = 0;

  int speed = 2;

  bool left = false;
  bool right = false;

  void feedDx(double dx) {
    x += dx;
  }

  void drawShip(Canvas canvas, ui.Image img) {
    Paint paint = Paint();

    canvas.drawImage(
      img,
      Offset(x, y),
      paint
    );
  }

  void detectWallCollision(Size size) {
    if(x + width > size.width) {
      x = size.width - width;
    }
    if(x < 0) {
      x = 0;
    }
  }

  void update(Canvas canvas, ui.Image img) {
    drawShip(canvas, img);
  }
}

class ShipPainter extends CustomPainter {
  ShipPainter({required this.image, required this.ship});

  final ui.Image image;

  final Spaceship ship;

  @override
  void paint(Canvas canvas, Size size) {
    ship.detectWallCollision(size);

    ship.update(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}