import 'package:flutter/material.dart';
import 'my_square.dart';

class MyControls extends StatelessWidget {
  const MyControls({required this.mySquare, super.key});

  final MySquare mySquare;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTapDown: (details) {
            mySquare.moveLeft = true;
          },

          onTapUp: (details) {
            mySquare.moveLeft = false;
          },

          child: const Icon(Icons.arrow_back, size: 40)
        ),
  
        Expanded(child: Center(
          child: GestureDetector(
            onTapDown: (details) {
              mySquare.shoot();
            },

            child: const Icon(Icons.settings, size: 40),

            // onTapUp: (details) {

            // },
          )
        )),
        
        GestureDetector(
          onTapDown: (details) {
            mySquare.moveRight = true;
          },

          onTapUp: (details) {
            mySquare.moveRight = false;
          },

          child: const Icon(Icons.arrow_forward, size: 40)
        ),
      ],
    );
  }
}
