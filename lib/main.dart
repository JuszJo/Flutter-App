import 'dart:async';
import 'dart:ui' as ui;
import 'package:flame/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GameCanvas(),
    )
  );
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
                  onVerticalDragStart: (details) {
                    
                  },
                  onVerticalDragUpdate: (details) {
                    
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 500,
                        height: 500,
                        child: CustomPaint(
                          painter: GamePainter(image: snapshot.data!),
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
  const GamePainter({required this.image});

  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    // game rendering logic

    final paint = Paint();
    paint.color = Colors.teal;

    canvas.drawImage(
      image,
      Offset(size.width / 2 - image.width / 2, size.height - image.height.toDouble()),
      paint
    );
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

class Spaceship {
  
}