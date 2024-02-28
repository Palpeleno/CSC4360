import 'dart:html';
import 'dart:math' as Math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawingApp(),
    );
  }
}

// static changes the page, using class to manipulate drawing
class DrawingApp extends StatefulWidget {
  @override
  _DrawingAppState createState() => _DrawingAppState();
}

class _DrawingAppState extends State<DrawingApp> {
  List<List<Offset>> lines = []; // Use a list of lists for each line
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing App'),
      ),

      // can detect touch, like mouse on movment
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            // renders the lines
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            final localPosition =
                renderBox.globalToLocal(details.globalPosition);
            if (lines.isEmpty || lines.last.isEmpty) {
              lines.add([localPosition]);
            } else {
              lines.last.add(localPosition);
            }
          });
        },
        // call back when not drawing, so when ink is drawn from "pen"
        onPanEnd: (_) {
          setState(() {
            lines.add([]);
          });
        },
        child: CustomPaint(
          painter: MyPainter(lines),
          size: Size.infinite,
        ),
      ),

      // checks action, then clears drawings that are created
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lines.clear();
          });
        },
        child: Icon(Icons.clear),
      ),
    );
  }
}

// populates list using parameters to draw on the canvas
class MyPainter extends CustomPainter {
  final List<List<Offset>> lines;
  MyPainter(this.lines);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (final line in lines) {
      for (int i = 0; i < line.length - 1; i++) {
        canvas.drawLine(line[i], line[i + 1], paint);
      }
    }
  }

  // the painter shuold re paint when rebuilding the widget
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmileyPainter extends CustomPainter {
  @override
  //make button to paint full drawing

  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Draw the body
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint().style = PaintingStyle.stroke;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius / 2), smilePaint());

    // Draw the eyes
    final paint2 = Paint()..color = Colors.black;
    canvas.drawCircle(center, radius, paint2);
  }

  // the painter shuold re paint when rebuilding the widget
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
