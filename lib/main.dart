import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/classes/collision.dart';

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
  late Future<ui.Image> meteorImage;
  late Future<List<ui.Image>> finalFuture;
  Spaceship ship = Spaceship();
  Bullet bullet = Bullet();
  Meteor meteor = Meteor();

  @override
  void initState() {
    super.initState();

    ship.bullet = bullet;

    ship.x = (widget.constraints.maxWidth / 2) - (ship.width / 2);
    ship.y = widget.constraints.maxHeight - 200;

    image = loadUiImage('assets/spaceship.png');
    bulletImage = loadUiImage('assets/lasers.png');
    meteorImage = loadUiImage('assets/asteroid.png');

    finalFuture = Future.wait([image, bulletImage, meteorImage]);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 16),
      vsync: this,
    )..addListener(() {
      // Update game state and render canvas
      setState(() {
        // checkBulletMeteorCollision(bullet.bullets, meteor.meteors);
      });
    });

    _animationController.repeat();
  }

  /* void checkBulletMeteorCollision(List bullets, List meteors) {
    if(bullet.bullets.isNotEmpty && meteor.meteors.isNotEmpty) {
      for(int i = 0; i < bullets.length; ++i) {
        List currentBullet = bullets[i];

        for(int j = 0; j < meteors.length; ++j) {
          List currentMeteor = meteors[j];

          if(
            currentBullet[0] + bullet.width > currentMeteor[0] + meteor.hitboxOffset["x"] &&
            currentBullet[0] < currentMeteor[0] + meteor.width + meteor.hitboxOffset["width"] &&
            currentBullet[1] + bullet.height > currentMeteor[1] + meteor.hitboxOffset["y"] &&
            currentBullet[1] < currentMeteor[1] + meteor.height + meteor.hitboxOffset["height"]
          ) {
            meteor.meteors.removeAt(j);
            bullet.bullets.removeAt(i);
          }
        }
      }
    }
  } */

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

                body: MySpaceShip(ship: ship, bullet: bullet, meteor: meteor, snapshot: snapshot),
              );
            }
        }
      }
    );
  }
}

class MySpaceShip extends StatelessWidget {
  const MySpaceShip({required this.ship, required this.bullet, required this.meteor, required this.snapshot, super.key});

  final Spaceship ship;
  final Bullet bullet;
  final Meteor meteor;
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
        // bullet.bullets.add([ship.x + (ship.width / 2) - (bullet.width / 2), ship.y - 20]);
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
              painter: MeteorPainter(image: snapshot.data![2], meteor: meteor),
              size: Size.infinite,
            ),
          ),

          SizedBox(
            width: 500,
            height: 600,
            child: CustomPaint(
              painter: CollisionPainter(bullet: bullet, meteor: meteor),
              size: Size.infinite,
            ),
          ),
        ]
      ),
    );
  }
}