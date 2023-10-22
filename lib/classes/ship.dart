import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Spaceship {
  double screenWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width / WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  double screenHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height / WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  int width = 50;
  int height = 63;
  double x = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width / WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  double y = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height / WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  int speed = 2;

  bool left = false;
  bool right = false;

  Spaceship() {
    x = x / 2 - width / 2;
    y = 600 - height.toDouble();
  }

  void feedDx(double dx) {
    x += dx;
  }

  void moveShip() {
    if(left) {
      x -= speed;
    }
    if(right) {
      x += speed;
    }
  }

  void detectWallCollision() {
    if(x + width > screenWidth) {
      x = screenWidth - width;
    }
    if(x < 0) {
      x = 0;
    }
  }

  void drawShip(Canvas canvas, ui.Image img) {
    Paint paint = Paint();

    canvas.drawImage(
      img,
      Offset(x, y),
      paint
    );
  }

  void update(Canvas canvas, ui.Image img) {
    drawShip(canvas, img);

    // moveShip();

    detectWallCollision();
  }
}