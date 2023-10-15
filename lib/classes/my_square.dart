import "dart:ui";

import "package:flutter/material.dart";

class MySquare {
  // FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

  double left = 100;
  double top = 20;
  double width = 50;
  double height = 50;

  bool moveLeft = false;
  bool moveRight = false;
  bool moveUp = false;
  bool moveDown = false;

  // bool isShooting = true;

  int speed = 5;

  MySquare() {
    // Size size = view.physicalSize / view.devicePixelRatio;

    top = 500 - height;
  }

  Rect getSquare() {
    return Rect.fromLTWH(left, top, width, height);
  }

  void movementListen() {
    if(moveLeft) {
      left -= speed;
    }
    if(moveRight) {
      left += speed;
    }
  }

  void shoot() {
    print("shoot");
  }

  void update() {
    movementListen();

    shoot();
  }

}