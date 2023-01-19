import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _isBig = false;
  double _size = 100.0;

  final _colorTween = ColorTween(
    begin: Colors.blue,
    end: Colors.purple,
  );

  final Tween<double> _animationTween = Tween(
    begin: 0,
    end: pi * 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Animate'),
                onPressed: () {
                  setState(() {
                    _isBig = !_isBig;
                    _size = _isBig ? 200 : 100;
                  });
                },
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.blue,
                height: _size,
                width: _size,
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                color: Colors.blue,
                height: _size,
                width: _size,
              ),
              const SizedBox(height: 8),
              TweenAnimationBuilder<double>(
                tween: _animationTween,
                duration: const Duration(seconds: 3),
                builder: (context, double value, child) {
                  return Transform.rotate(
                    angle: value,
                    child: Container(
                      color: Colors.blue,
                      height: _size,
                      width: _size,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              TweenAnimationBuilder<Color?>(
                tween: _colorTween,
                duration: const Duration(seconds: 3),
                builder: (context, Color? value, child) {
                  return Container(
                    color: value,
                    height: _size,
                    width: _size,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
