// Custome Painter

import 'package:flutter/material.dart';
import 'package:my_app/classes/controls.dart';
import 'package:my_app/classes/my_square.dart';

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

  MySquare mySquare = MySquare();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 16),
      vsync: this,
    )..addListener(() {

      // Update game state and render canvas

      setState(() {
        mySquare.movementListen();
      });
    });

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"), centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 500,
            child: CustomPaint(
              painter: GamePainter(mySquare: mySquare),
              size: Size.infinite,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: MyControls(mySquare: mySquare)
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}

class GamePainter extends CustomPainter {
  GamePainter({required this.mySquare});

  final MySquare mySquare;

  @override
  void paint(Canvas canvas, Size size) {
    // game rendering logic

    final paint = Paint();
    paint.color = Colors.teal;

    canvas.drawRect(mySquare.getSquare(), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}