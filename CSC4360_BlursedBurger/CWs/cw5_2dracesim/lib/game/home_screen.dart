// ignore_for_file: prefer_const_constructors

import 'package:cw5_2dracesim/game/play_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCar = 'player.png'; // Initial selected rocket/player option

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Space Shooter Game'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'f1GrandPrixDeMONACO24_tracks_stats.png'), // Replace 'background_image.jpg' with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarOption(
                      imagePath: 'assets/images/player.png',
                      isSelected: selectedCar == 'player.png',
                      onPressed: () {
                        setState(() {
                          selectedCar = 'player.png';
                        });
                      },
                    ),
                    CarOption(
                      imagePath: 'assets/images/player2.png',
                      isSelected: selectedCar == 'player2.png',
                      onPressed: () {
                        setState(() {
                          selectedCar = 'player2.png';
                        });
                      },
                    ),
                    CarOption(
                      imagePath: 'assets/images/player3.png',
                      isSelected: selectedCar == 'player3.png',
                      onPressed: () {
                        setState(() {
                          selectedCar = 'player3.png';
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                    height: screenHeight *
                        0.1), // Adding space between buttons and the "Start Game" button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GameWidget(game: PalRacingGame(selectedCar))),
                    );
                  },
                  child: Text('Start Game'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarOption extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;

  CarOption({
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(
            screenWidth * 0.03), // Adjust padding based on screen width
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(imagePath,
            width:
                screenWidth * 0.2), // Adjust image size based on screen width
      ),
    );
  }
}
