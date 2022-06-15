import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numTaps = 0;
  int _numDoubleTaps = 0;
  int _numLongPress = 0;

  final double _boxSize = 150.0;
  double _posX = 0.0;
  double _posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (_posX == 0) {
      _center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detector'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: _posY,
            left: _posX,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _numTaps++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  _numDoubleTaps++;
                });
              },
              onLongPress: () {
                setState(() {
                  _numLongPress++;
                });
              },
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  _posX += deltaX;
                  _posY += deltaY;
                });
              },
              child: Container(
                width: _boxSize,
                height: _boxSize,
                decoration: const BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Taps: $_numTaps - Double Taps: $_numDoubleTaps - Long Press: $_numLongPress',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  void _center(BuildContext context) {
    setState(() {
      _posX = (MediaQuery.of(context).size.width / 2) - _boxSize / 2;
      _posY = (MediaQuery.of(context).size.height / 2) -
          _boxSize / 2 -
          kToolbarHeight;
    });
  }
}
