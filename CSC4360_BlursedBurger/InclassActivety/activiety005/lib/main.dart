// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DigitalPetApp(),
  ));
}

class DigitalPetApp extends StatefulWidget {
  @override
  _DigitalPetAppState createState() => _DigitalPetAppState();
}

// class LinearProgressIndicator extends StatefulWidget {
//   @override
//   _DigitalPetAppState createState() => _DigitalPetAppState();
// }

class _DigitalPetAppState extends State<DigitalPetApp> {
  String petName = "Virgil";
  int happinessLevel = 50;
  int hungerLevel = 50;
  int hitpoints = 100;
  double energylvl = 100;

  List<Color> happinessColors = [
    Colors.red, // for angry
    Colors.yellow, // annoyed
    Colors.green, // for satiatied
  ];

  Color getPetColor() {
    if (happinessLevel < 30) {
      // for angry angry
      return happinessColors[0];
    } else if (happinessLevel < 70) {
      // for annoyed yellow
      return happinessColors[1];
    } else {
      return happinessColors[2]; // for satiatied green
    }
  }

  void _playWithPet() {
    setState(() {
      happinessLevel += 10;
      _updateHunger();
    });
  }

  void _feedPet() {
    setState(() {
      hungerLevel -= 10;
      hitpoints += 10;
      _updateHappiness();
    });
  }

  void _updateHappiness() {
    if (hungerLevel < 30) {
      happinessLevel -= 20;
      hitpoints -= 5;
    } else {
      happinessLevel += 10;
      hitpoints = 100;
    }
  }

  void _updateHunger() {
    setState(() {
      hitpoints += 5;
      hungerLevel += 5;
      if (hungerLevel > 100) {
        hungerLevel = 100;
        hitpoints = 100;
        happinessLevel -= 20;
      }
    });
  }

  void Pet_imageState() {
    setState(() {
      if (hungerLevel < 50 && happinessLevel < 50) {
        _getMood();
      }
    });
  }

  void _getMood() {}

  void _decreaseEnergy() {
    setState(() {
      energylvl -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Pet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 20, color: getPetColor()),
              ),
              child: Image.asset(
                '/defualt_ODSTVirgil.jpg',
                width: 300,
                height: 150,
              ),
            ),
            Text(
              'Name: $petName',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Happiness Level: $happinessLevel',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hunger Level: $hungerLevel',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'HP: $hitpoints',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'MP: $energylvl',
              style: TextStyle(fontSize: 20.0),
            ),
            LinearProgressIndicator(
              value: energylvl,

              //     // 'Energy Level: $energylvl',
              //     // style: TextStyle(fontSize: 20.0, ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _playWithPet,
              child: Text('Play with Your Pet'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _feedPet,
              child: Text('Feed Your Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
