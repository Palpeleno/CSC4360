import 'package:flutter/material.dart';
import 'package:calculator_hw1/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virgil:Calculator',
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

