import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'classes/ship.dart';
import "classes/bullet.dart";
import 'package:my_app/classes/meteor.dart';

import 'utils/utils.dart';

Future<void> _initializeView() {
  final completer = Completer<void>();

  final oldOnMetricsChanged = PlatformDispatcher.instance.onMetricsChanged!;

  PlatformDispatcher.instance.onMetricsChanged = () {
    if (_isViewInitialized && !completer.isCompleted) {
      // revert monkey patch
      PlatformDispatcher.instance.onMetricsChanged = oldOnMetricsChanged;

      completer.complete(null);
    }

    oldOnMetricsChanged();
  };

  return completer.future;
}

bool get _isViewInitialized => PlatformDispatcher.instance.views.any((v) => v.physicalSize > Size.zero);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(!_isViewInitialized) {
    await _initializeView();
  }

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
  late Future<ui.Image> bulletImage;
  late Future<List<ui.Image>> finalFuture;
  Spaceship ship = Spaceship();
  Bullet bullet = Bullet();

  @override
  void initState() {
    super.initState();

    ship.x = (widget.constraints.maxWidth / 2) - (ship.width / 2);
    ship.y = widget.constraints.maxHeight - 200;

    image = loadUiImage('assets/spaceship.png');
    bulletImage = loadUiImage('assets/lasers.png');

    finalFuture = Future.wait([image, bulletImage]);

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
    return FutureBuilder<List<ui.Image>>(
      future: finalFuture,
      
      builder: (BuildContext context, AsyncSnapshot<List<ui.Image>> snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting: return const Text('Image Loading');
          default:
            if(snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Space Shooters'), centerTitle: true,
                ),

                body: MySpaceShip(ship: ship, bullet: bullet, snapshot: snapshot),
              );
            }
        }
      }
    );
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

          SizedBox(
            width: 500,
            height: 600,
            child: CustomPaint(
              painter: MeteorPainter(),
              size: Size.infinite,
            ),
          ),
        ]
      ),
    );
  }
}