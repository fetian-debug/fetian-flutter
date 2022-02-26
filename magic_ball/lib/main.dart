import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ballNum = 1;

  void ballChange() {
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Asking Me Anything'),
            ),
          ),
          backgroundColor: Colors.blueAccent,
          body: Center(
            child: TextButton(
              onPressed: ballChange,
              child: Expanded(
                child: Image.asset('images/ball$ballNum.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
