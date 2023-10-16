import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GameCanvas(),
    )
  );
}

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

    moveShip();

    detectWallCollision();
  }
}

class Bullet {
  int width = 10;
  int height = 10;
}

class GameCanvas extends StatefulWidget {
  const GameCanvas({super.key});

  @override
  State<GameCanvas> createState() => _GameCanvasState();
}

class _GameCanvasState extends State<GameCanvas> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Future<ui.Image> image;

  @override
  void initState() {
    super.initState();

    image = loadUiImage('assets/spaceship.png');

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 16),
      vsync: this,
    )..addListener(() {

      // Update game state and render canvas

      setState(() {
        
      });
    });

    _animationController.repeat();
  }

  Spaceship ship = Spaceship();

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

                body: GestureDetector(
                  onHorizontalDragStart: (details) {

                  },
                  onHorizontalDragUpdate: (details) {
                    if(details.delta.dx < 0) {
                      // print(details.delta.dx);
                      ship.left = true;
                      ship.right = false;
                    }
                    else if(details.delta.dx > 0) {
                      // print(details.delta.dx);
                      ship.right = true;
                      ship.left = false;
                    }
                  },
                  onHorizontalDragEnd: (details) {
                    ship.left = false;
                    ship.right = false;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 500,
                        height: 600,
                        child: CustomPaint(
                          painter: GamePainter(image: snapshot.data!, ship: ship),
                          size: Size.infinite,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        }
      }
    );
  }
}

class GamePainter extends CustomPainter {
  GamePainter({required this.image, required this.ship});

  final ui.Image image;

  final Spaceship ship;

  @override
  void paint(Canvas canvas, Size size) {
    // game rendering logic

    // final paint = Paint();
    // paint.color = Colors.teal;

    ship.update(canvas, image);

    // canvas.drawImage(
    //   image,
    //   Offset(size.width / 2 - image.width / 2, size.height - image.height.toDouble()),
    //   paint
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Future<ui.Image> loadUiImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);

  final Completer<ui.Image> completer = Completer();

  ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    
    return completer.complete(img);
  });

  return completer.future;
}