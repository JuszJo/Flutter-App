/* import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TicTacToe(),
    )
  );
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _GameState();
}

class _GameState extends State<TicTacToe> {
  List<String> boxState = ['', '', '', '', '', '', '', '', ''];

  String currentTurn = 'X';

  Map scores = <String, int>{
    'X': 0,
    'O': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'), centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 400, child: _buildGrid(context)),

          _showScore(),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    int totalBoxes = 9;

    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: <Widget>[
          for(int i = 0; i < totalBoxes; ++i) ...[
            _buildBox(boxState[i], i),
          ],
        ],
      ),
    );
  }

  Widget _buildBox(String state, int id) {
    return GestureDetector(
      onTap: () {
        _boxPress(id);
      },

      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.black,
          ),
        ),

        child: Center(
          child: Text(
            state, 
            style: const TextStyle(fontSize: 40)),
        ),
      ),
    );
  }

  Widget _showScore() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: Text(
            'X score: ${scores['X']}',
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            'O score: ${scores['O']}',
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ],
    );
  }

  void _boxPress(int id) {
    setState(() {
      boxState[id] = currentTurn;

      _switchTurn();
    });
  }

  void _switchTurn() {
    if(_checkRowWin()) {
      _showWinner(currentTurn);
      // print('$currentTurn has won');
    }
    else if(_checkColWin()) {
      _showWinner(currentTurn);
      // print('$currentTurn has won');
    }
    else if(_checkCrossWin()) {
      _showWinner(currentTurn);
      // print('$currentTurn has won');
    }
    else if(boxState.every((element) => element != '')) {
      _showDraw();
    }
    else {
      currentTurn = currentTurn == 'X' ? 'O' : 'X';
    }
  }

  bool _checkRowWin() {
    bool row1Win = false;
    bool row2Win = false;
    bool row3Win = false;

    row1Win = boxState.sublist(0, 3).every((element) => element == boxState[0] && element != '');
    row2Win = boxState.sublist(3, 6).every((element) => element == boxState[3] && element != '');
    row3Win = boxState.sublist(6, 9).every((element) => element == boxState[6] && element != '');

    if(row1Win) {
      return row1Win;
    }
    else if(row2Win) {
      return row2Win;
    }
    else if(row3Win) {
      return row3Win;
    }
    else {
      return false;
    }
  }

  bool _checkColWin() {
    bool col1Win = false;
    bool col2Win = false;
    bool col3Win = false;

    if(
      boxState[0] == boxState[3] &&
      boxState[0] == boxState[6] &&
      boxState[0] != ''
    ) {
      col1Win = true;
    }

    if(
      boxState[1] == boxState[4] &&
      boxState[1] == boxState[7] &&
      boxState[1] != ''
    ) {
      col2Win = true;
    }

    if(
      boxState[2] == boxState[5] &&
      boxState[2] == boxState[8] &&
      boxState[2] != ''
    ) {
      col3Win = true;
    }

    // col1Win = boxState.sublist(0, 3).every((element) => element == boxState[0]);
    // col2Win = boxState.sublist(3, 6).every((element) => element == boxState[3]);
    // col3Win = boxState.sublist(6, 9).every((element) => element == boxState[6]);

    if(col1Win) {
      return col1Win;
    }
    else if(col2Win) {
      return col2Win;
    }
    else if(col3Win) {
      return col3Win;
    }
    else {
      return false;
    }
  }

  bool _checkCrossWin() {
    bool cross1Win = false;
    bool cross2Win = false;

    if(
      boxState[0] == boxState[4] &&
      boxState[0] == boxState[8] &&
      boxState[0] != '' 
    ) {
      cross1Win = true;
    }

    if(
      boxState[2] == boxState[4] &&
      boxState[2] == boxState[6] &&
      boxState[2] != ''
    ) {
      cross2Win = true;
    }

    if(cross1Win) {
      return cross1Win;
    }
    if(cross2Win) {
      return cross2Win;
    }
    else {
      return false;
    }
  }

  void _showWinner(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("$winner has won")),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                scores[currentTurn] += 1;

                _clearStates();

                Navigator.of(context).pop();
              },
              child: const Center(
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _showDraw() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Draw")),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _clearStates();

                Navigator.of(context).pop();
              },
              child: const Center(
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _clearStates() {
    setState(() {
      boxState = ['', '', '', '', '', '', '', '', ''];

      currentTurn = 'X';
    });
  }
} */

// A "pure widgets" implementation for the classic Retro Race Games
// Pseudo-3D tracks with curves and background scrolling.

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Race',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Retro Race'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  final backW = [1, 2, 1, 1, 3, 1, 3, 1, 2, 1, 2, 3, 2, 1];
  final backH = [4, 2, 3, 1, 2, 2, 1, 4, 3, 2, 4, 3, 1, 3];

  final track = [
    Segment(0.0, 10.0),
    Segment(0.0, 200.0),
    Segment(1.0, 200.0),
    Segment(0.0, 400.0),
    Segment(-1.0, 200.0),
    Segment(0.0, 400.0),
    Segment(-1.0, 400.0),
    Segment(1.0, 400.0),
    Segment(0.0, 400.0),
    Segment(0.3, 500.0),
    Segment(-0.1, 100.0),
    Segment(-1.2, 300.0),
    Segment(1.0, 300.0),
    Segment(0.2, 300.0),
    Segment(0.0, 500.0),
  ];
  var middlePoint = 0.0;
  var speed = 0.0;
  var accelerating = false;
  var leftDown = false;
  var rightDown = false;
  var distance = 35.0;
  var prevt = 0.0;
  var curvature = 0.0;
  var trackCurvature = 0.0;
  var playerCurvature = 0.0;
  late var maxDistance;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.repeat();
    maxDistance = track.fold<double>(0.0, (a, b) => b.dist + a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final w = MediaQuery.of(context).size.width;
                    final b = w ~/ 20;
                    return Stack(
                      children: [
                        Container(
                          color: Colors.lightBlue,
                        ),
                        Positioned(
                          bottom: 0,
                          left: -trackCurvature * b * 10,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0; i < backW.length * 5; i++)
                                Container(
                                  width: backW[i % backW.length].toDouble() * b,
                                  height:
                                      backH[i % backW.length].toDouble() * b,
                                  color: Colors.black.withOpacity(1.0 -
                                      (backH[i % backH.length] / 5.0) * 0.5),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final w = constraints.maxWidth;
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        final t = (controller.value - prevt).clamp(0.0, 1.0);
                        speed = (speed + (accelerating ? 2.0 * t : -3.0 * t))
                            .clamp(0.0, 1.0);
                        prevt = controller.value;
                        distance += 1000 * t * speed;
                        if (distance > maxDistance) {
                          distance -= maxDistance;
                        }
                        var carDirection = 0;
                        if (leftDown) {
                          playerCurvature -= 2.0 * t * (1.0 - speed / 2.0);
                          carDirection = -1;
                        }
                        if (rightDown) {
                          playerCurvature += 2.0 * t * (1.0 - speed / 2.0);
                          carDirection = 1;
                        }
                        if ((playerCurvature - trackCurvature).abs() >= 0.6) {
                          speed = (speed - 7.0 * t).clamp(0.0, 1.0);
                        }
                        var trackSection = 0;
                        var offset = 0.0;

                        while (
                            trackSection < track.length && offset <= distance) {
                          offset += track[trackSection].dist;
                          trackSection++;
                        }
                        final targetCurve = track[trackSection - 1].curve;
                        final curvatureDiff =
                            (targetCurve - curvature) * t * speed * 3.0;
                        curvature += curvatureDiff;
                        trackCurvature += curvature * t * speed * 5.0;
                        final playerPosition =
                            (playerCurvature - trackCurvature) * w / 2.0;
                        return Stack(
                          children: [
                            Column(
                              children: List.generate(
                                50,
                                (y) {
                                  final perspective = y / 50.0 / 2.0;
                                  final middle = 0.5 +
                                      curvature * pow(1.0 - perspective, 3);
                                  final roadWidth =
                                      (0.1 + perspective * 0.8) / 2.0;
                                  final clipWidth = roadWidth * 0.3;

                                  final leftGrassX =
                                      (middle - roadWidth - clipWidth) * w;
                                  final leftClipX = (middle - roadWidth) * w;
                                  final rightGrassX =
                                      (middle + roadWidth + clipWidth) * w;
                                  final rightClipX = (middle + roadWidth) * w;

                                  final leftGrass =
                                      leftGrassX > 0.0 && leftGrassX <= w
                                          ? leftGrassX
                                          : leftGrassX > w
                                              ? w
                                              : 0.0;
                                  final leftClip = leftClipX > 0.0
                                      ? min(leftClipX, w) - leftGrass
                                      : 0.0;
                                  final rightGrass =
                                      rightGrassX > 0.0 && rightGrassX <= w
                                          ? w - rightGrassX
                                          : rightGrassX <= 0
                                              ? w
                                              : 0.0;
                                  final rightClip = rightClipX < w
                                      ? w - max(rightClipX, 0.0) - rightGrass
                                      : 0.0;

                                  final roadSize = max(
                                      w -
                                          leftGrass -
                                          leftClip -
                                          rightGrass -
                                          rightClip,
                                      0.0);
                                  final grassColor = sin(
                                              20.0 * pow(1.0 - perspective, 3) +
                                                  distance * 0.1) >
                                          0.0
                                      ? Colors.greenAccent
                                      : Colors.green[400];
                                  final clipColor = sin(
                                              50.0 * pow(1.0 - perspective, 3) +
                                                  distance * 0.5) >
                                          0.0
                                      ? Colors.red
                                      : Colors.white;
                                  return Expanded(
                                    child: Row(
                                      children: [
                                        if (leftGrass > 0)
                                          Container(
                                            width: leftGrass,
                                            color: grassColor,
                                          ),
                                        if (leftClip > 0)
                                          Container(
                                            width: leftClip,
                                            color: clipColor,
                                          ),
                                        if (roadSize > 0)
                                          Container(
                                            width: roadSize,
                                            color: distance - y >= 0 &&
                                                    distance - y < 1
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        if (rightClip > 0)
                                          Container(
                                            width: rightClip,
                                            color: clipColor,
                                          ),
                                        if (rightGrass > 0)
                                          Container(
                                            width: rightGrass,
                                            color: grassColor,
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: (w / 2) - (75 / 2) + playerPosition,
                              child: SizedBox(
                                height: w / 10.0,
                                width: w / 10.0,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Column(
                                    crossAxisAlignment: carDirection == 0
                                        ? CrossAxisAlignment.center
                                        : carDirection == 1
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Container(
                                          color: Colors.black,
                                          width: 10,
                                          height: 20,
                                        ),
                                        Container(
                                          color: Colors.blue[800],
                                          width: 20,
                                          height: 10,
                                        ),
                                        Container(
                                          color: Colors.black,
                                          width: 10,
                                          height: 20,
                                        ),
                                      ]),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Container(
                                          color: Colors.blue[800],
                                          width: 20,
                                          height: 5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Container(
                                          color: Colors.blue[400],
                                          width: 40,
                                          height: 10,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Container(
                                          color: Colors.blue[800],
                                          width: 60,
                                          height: 15,
                                        ),
                                      ),
                                      Row(children: [
                                        Container(
                                          color: Colors.black,
                                          width: 30,
                                          height: 40,
                                        ),
                                        Container(
                                          color: Colors.blue[800],
                                          width: 65,
                                          height: 30,
                                        ),
                                        Container(
                                          color: Colors.black,
                                          width: 30,
                                          height: 40,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    accelerating = !accelerating;
                  });
                },
                child: Icon(
                  accelerating ? Icons.cancel : Icons.arrow_circle_up_outlined,
                  size: 50,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  GestureDetector(
                    onTapDown: (_) {
                      leftDown = true;
                    },
                    onTapUp: (_) {
                      leftDown = false;
                    },
                    child: Transform.rotate(
                      angle: -pi / 2.0,
                      child: Icon(
                        Icons.arrow_circle_up_outlined,
                        size: 50,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapDown: (_) {
                      rightDown = true;
                    },
                    onTapUp: (_) {
                      rightDown = false;
                    },
                    child: Transform.rotate(
                      angle: pi / 2.0,
                      child: Icon(
                        Icons.arrow_circle_up_outlined,
                        size: 50,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Segment {
  final double curve;
  final double dist;
  Segment(this.curve, this.dist);
}
