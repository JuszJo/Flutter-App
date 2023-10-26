import 'package:flutter/material.dart';
import 'package:my_app/classes/bullet.dart';
import 'package:my_app/classes/meteor.dart';

class CollisionPainter extends CustomPainter {
  CollisionPainter({required this.bullet, required this.meteor});

  Bullet bullet;
  Meteor meteor;

  @override
  void paint(Canvas canvas, Size size) {
    checkBulletMeteorCollision(bullet.bullets, meteor.meteors);
  }

  void checkBulletMeteorCollision(List bullets, List meteors) {
    if(bullet.bullets.isNotEmpty && meteor.meteors.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        List currentBullet = bullets[i];

        for(int j = 0; j < meteors.length; ++j) {
          List currentMeteor = meteors[j];

          if(
            currentBullet[0] + bullet.width > currentMeteor[0] &&
            currentBullet[0] < currentMeteor[0] + meteor.width &&
            currentBullet[1] + bullet.height > currentMeteor[1] &&
            currentBullet[1] < currentMeteor[1] + meteor.height
          ) {
            meteor.meteors.removeAt(j);
            bullet.bullets.removeAt(i);
          }
          /* if(
            currentBullet[0] + bullet.width > currentMeteor[0] + meteor.hitboxOffset["x"] &&
            currentBullet[0] < currentMeteor[0] + meteor.width + meteor.hitboxOffset["width"] &&
            currentBullet[1] + bullet.height > currentMeteor[1] + meteor.hitboxOffset["y"] &&
            currentBullet[1] < currentMeteor[1] + meteor.height + meteor.hitboxOffset["height"]
          ) {
            meteor.meteors.removeAt(j);
            bullet.bullets.removeAt(i);
          } */
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}