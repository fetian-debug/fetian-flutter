import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int leftDiceNum = 1;
  int rightDiceNum = 2;

  void changeDiceFace() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text('Dicee App'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Row(children: [
            Expanded(
              child: TextButton(
                onPressed: changeDiceFace,
                child: Image.asset(
                  'images/dice$leftDiceNum.png',
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: changeDiceFace,
                child: Image.asset(
                  'images/dice$rightDiceNum.png',
                  color: Colors.green,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
