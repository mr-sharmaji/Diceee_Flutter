import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: DicePage(),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int max = 6;
  void reset() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Dicee App",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          leftDiceNumber = Random().nextInt(max) + 1;
                        });
                      },
                      child: Image.asset(
                        'images/dice$leftDiceNumber.png',
                      ),
                    ),
                    Text(
                      "Player 1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          rightDiceNumber = Random().nextInt(max) + 1;
                        });
                      },
                      child: Image.asset('images/dice$rightDiceNumber.png'),
                    ),
                    Text(
                      "Player 2",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            leftDiceNumber = 1;
            rightDiceNumber = 1;
          });
        },
        child: Text("Reset"),
      ),
    );
  }
}
