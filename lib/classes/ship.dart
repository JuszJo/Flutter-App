import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'bullet.dart';

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

class MySpaceShip extends StatelessWidget {
  const MySpaceShip({required this.ship, required this.bullet, required this.snapshot, super.key});

  final Spaceship ship;
  final Bullet bullet;
  final AsyncSnapshot<List<ui.Image>> snapshot;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {

      },
      onHorizontalDragUpdate: (details) {
        if(details.delta.dx < 0) {
          ship.feedDx(details.delta.dx);
        }
        else if(details.delta.dx > 0) {
          ship.feedDx(details.delta.dx);
        }
      },
      onHorizontalDragEnd: (details) {
        bullet.bullets.add([ship.x + (ship.width / 2) - (bullet.width / 2), ship.y - 20]);
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: 500,
            height: 600,
            child: CustomPaint(
              painter: ShipPainter(image: snapshot.data![0], ship: ship),
              size: Size.infinite,
            ),
          ),

          SizedBox(
            width: 500,
            height: 600,
            child: CustomPaint(
              painter: BulletPainter(image: snapshot.data![1], bullet: bullet),
              size: Size.infinite,
            ),
          ),
        ]
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
    ship.detectWallCollision(size);

    ship.update(canvas, image);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}