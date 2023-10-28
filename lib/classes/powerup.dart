import 'package:flutter/material.dart';

class PowerUp {
  double x = 100;
  double y = 0;
  double width = 20;
  double height = 20;
  double speed = 1;
  bool time = true;
  List powerUp = [];

  void movePowerUp() {
    y += speed;
  }

  void generatePowerUp() {
    powerUp.add(1);

    time = false;
  }

  void drawPowerUp(Canvas canvas) {
    for(int i = 0; i < powerUp.length; ++i) {
      canvas.drawCircle(Offset(x, y), 10, Paint());
      // canvas.drawRect(
      //   Rect.fromLTWH(x, y, width, height),
      //   Paint()
      // );
    }
  }
}

class PowerUpPainter extends CustomPainter {
  PowerUpPainter({required this.powerUp});

  PowerUp powerUp;

  @override
  void paint(Canvas canvas, Size size) {
    powerUp.drawPowerUp(canvas);

    powerUp.movePowerUp();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}