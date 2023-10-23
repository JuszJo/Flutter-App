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

  // Spaceship() {
    // x = x / 2 - width / 2;
    // y = 600 - height.toDouble();
  // }
  // Spaceship() {
  //   x = x / 2 - width / 2;
  //   y = 600 - height.toDouble();
  // }

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

    // detectWallCollision();
  }
}

class MySpaceShip extends StatelessWidget {
  const MySpaceShip({required this.ship, required this.snapshot, required this.context, super.key});

  final Spaceship ship;
  final AsyncSnapshot<ui.Image> snapshot;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {

      },
      onHorizontalDragUpdate: (details) {
        if(details.delta.dx < 0) {
          // print(details.delta.dx);
          ship.feedDx(details.delta.dx);
          ship.left = true;
          ship.right = false;
          // bullet.y -= 0.1;
        }
        else if(details.delta.dx > 0) {
          // print(details.delta.dx);
          ship.feedDx(details.delta.dx);
          ship.right = true;
          ship.left = false;
        }
      },
      onHorizontalDragEnd: (details) {
        // bullet.shot = true;
        // bullet.moving = true;
        ship.left = false;
        ship.right = false;
        // bullet.x = ship.x + (ship.width / 2) - (bullet.width / 2);
        // bullet.y = ship.y - ship.height / 2;
      },
      child: SizedBox(
        width: 500,
        height: 600,
        child: CustomPaint(
          painter: ShipPainter(image: snapshot.data!, ship: ship),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class ShipPainter extends CustomPainter {
  ShipPainter({required this.image, required this.ship});

  final ui.Image image;

  final Spaceship ship;

  @override
  void paint(Canvas canvas, Size size) {
    if(ship.x + ship.width > size.width) {
      ship.x = size.width - ship.width;
    }
    if(ship.x < 0) {
      ship.x = 0;
    }
    ship.update(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}