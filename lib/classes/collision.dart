import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MeteorAnimated {
  int meteorSprites = 7;
  double currentIndex = 1;
  double buffer = 0;
  double nextFrame = 5;
  List<List> destroyed = [];

  void animate() {
    if(buffer == nextFrame) {
      for (var i = 0; i < destroyed.length; i++) {
        destroyed[i][2] += 1;

        if(destroyed[i][2] > 7) {
          destroyed.removeAt(i);
        }
      }
      buffer = 0;
    }

    ++buffer;
  }
}

class CollisionPainter extends CustomPainter {
  CollisionPainter({required this.image, required this.animatedMeteor});

  ui.Image image;
  MeteorAnimated animatedMeteor;

  void drawExplosion(Canvas canvas) {
    if(animatedMeteor.destroyed.isNotEmpty) {
      for(var i = 0; i < animatedMeteor.destroyed.length; i++) {
        canvas.drawAtlas(
          image,
          <RSTransform>[
            for(List destroyedMeteor in animatedMeteor.destroyed)
              RSTransform.fromComponents(
                rotation: 0.0,
                scale: 1.0,
                anchorX: 28.0,
                anchorY: 32.0,
                translateX: destroyedMeteor[0],
                translateY: destroyedMeteor[1]
              )
          ],
          <Rect>[
            for(List destroyedMeteor in animatedMeteor.destroyed) 
              Rect.fromLTWH(destroyedMeteor[2] * 96, 0, 96, 96)
          ],
          null,
          null,
          null,
          Paint()
        );
      }

      animatedMeteor.animate();
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawExplosion(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}