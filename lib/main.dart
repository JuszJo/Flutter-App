import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'classes/ship.dart';

import "classes/bullet.dart";
import 'utils/utils.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SpaceShooters(),
    )
  );
}

class SpaceShooters extends StatelessWidget {
  const SpaceShooters({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GameCanvas(constraints: constraints);
      }
    );
  }
}

class GameCanvas extends StatefulWidget {
  const GameCanvas({required this.constraints, super.key});

  final BoxConstraints constraints;

  @override
  State<GameCanvas> createState() => _GameCanvasState();
}

class _GameCanvasState extends State<GameCanvas> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Future<ui.Image> image;
  Spaceship ship = Spaceship();
  Bullet bullet = Bullet();

  @override
  void initState() {
    super.initState();

    ship.x = (widget.constraints.maxWidth / 2) - (ship.width / 2);
    ship.y = widget.constraints.maxHeight - 200;

    image = loadUiImage('assets/spaceship.png');

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 16),
      vsync: this,
    )..addListener(() {
      // Update game state and render canvas
      setState(() {});
    });

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: image,
      
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting: return const Text('Image Loading');
          default:
            if(snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Space Game"), centerTitle: true,
                ),

                body: Stack(
                  children: [
                    MySpaceShip(ship: ship, snapshot: snapshot, context: context),
                    // SizedBox(
                    //   width: 500,
                    //   height: 600,
                    //   child: CustomPaint(
                    //     painter: BulletPainter(bullet: bullet),
                    //     size: Size.infinite,
                    //   ),
                    // ),
                  ],
                ),
              );
            }
        }
      }
    );
  }
}

class BulletPainter extends CustomPainter {
  BulletPainter({required this.bullet});

  final Bullet bullet;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    if(bullet.shot && bullet.moving) {
      canvas.drawRect(
        Rect.fromLTWH(bullet.x, bullet.y, bullet.width, bullet.height),
        paint
      );

      bullet.y -= bullet.speed;
    }

    if(bullet.y < 0) {
      bullet.shot = false;
      bullet.moving = false;
      bullet.y = 400;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}