import 'dart:ui';

class Bullet {
  double x = 0;
  double y = 0;
  double width = 10;
  double height = 15;
  double speed = 5;
  bool shot = false;
  bool moving = false;
  List bullets = [];

  void paintBullets(Canvas canvas) {
    if(bullets.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        Rect bulletRect = Rect.fromLTWH(bullets[i][0], bullets[i][1], width, height);

        canvas.drawRect(bulletRect, Paint());

        bullets[i][1] -= speed;
      }
    }
  }
}