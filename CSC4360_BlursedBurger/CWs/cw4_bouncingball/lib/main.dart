// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(BouncingBallApp());
}

class BouncingBallApp extends StatelessWidget {
  const BouncingBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BouncingBallScreen(),
    );
  }
}

class BouncingBallScreen extends StatefulWidget {
  const BouncingBallScreen({super.key});

  @override
  _BouncingBallScreenState createState() => _BouncingBallScreenState();
}

class _BouncingBallScreenState extends State<BouncingBallScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double ballSize = 80.0;
  double ballSpeed = 1.0;
  Color ballColor = Colors.blue;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {}); // Redraw the UI on every animation tick
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bouncing Ball App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 5.0),
              ),
              child: Center(
                child: Container(
                  width: ballSize,
                  height: ballSize,
                  decoration: BoxDecoration(
                    color: ballColor,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.only(top: _animation.value * 210),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _controller.repeat(reverse: true);
                  },
                  child: Text('Start'),
                ),
                OutlinedButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  child: Text('Stop'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Speed'),
            Slider(
              value: ballSpeed,
              onChanged: (value) {
                setState(() {
                  ballSpeed = value;
                  _controller.duration = Duration(seconds: (4 / value).round());
                });
                // if statement for dynamic changes to animation
                //from slider manipulation
                if (_controller.isAnimating) {
                  _controller.repeat(reverse: true);
                }
              },
              min: 0.5,
              max: 5.0,
            ),
            SizedBox(height: 20),
            Text('Color'),
            OutlinedButton(
              onPressed: () {
                _showColorPicker();
              },
              child: Text('Choose Color'),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPicker() {
    Color selectedColor = ballColor;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose a Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: ballColor,
              onColorChanged: (color) {
                setState(() {
                  ballColor = color;
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
