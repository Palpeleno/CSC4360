import 'package:flutter/material.dart';
import 'game/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pal Jank Racing Sim',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(), // Set HomeScreen as the initial screen
    );
  }
}
