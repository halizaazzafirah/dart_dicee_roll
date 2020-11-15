import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[600],
        appBar: AppBar(
          title: Text(
            'Roll Your Dice',
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
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

  int generateRandom() {
    return Random().nextInt(6) + 1;
  }

  void setRandomDiceNumber() {
    setState(() {
      leftDiceNumber = generateRandom();
      rightDiceNumber = generateRandom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 130.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset('images/diceeLogo.png'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/dice$leftDiceNumber.png'),
                Image.asset('images/dice$rightDiceNumber.png'),
              ],
            ),
          ),
          FlatButton(
            padding: EdgeInsets.all(10.0),
            onPressed: setRandomDiceNumber,
            child: Text(
              'ROLL',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.red,
          ),
        ],
      ),
    ));
  }
}
