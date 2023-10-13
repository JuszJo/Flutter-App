import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'), centerTitle: true,
      ),

      body: _buildGrid(context),
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
}