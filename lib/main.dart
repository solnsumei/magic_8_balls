import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.teal.shade900,
      ),
      home: BallPage(),
    );
  }
}

class BallPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.teal.shade900,
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  final TextEditingController questionController = TextEditingController();
  int ballNumber = 3;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          color: Colors.teal[50],
          child: TextField(
            controller: questionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type your question',
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            child: Image.asset('images/ball$ballNumber.png'),
            onPressed: questionController.text.trim().length < 2 ? null : () {
              setState(() {
                ballNumber = Random().nextInt(5) + 1;
                questionController.clear();
              });
            },
          ),
        ),
      ],
    );
  }
}

