// ignore_for_file: prefer_const_constructors

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../game/play_game.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCar = 'pitstop_car_1.png';

  Widget buildCarOption(String imagePath, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CarOption(
          imagePath: imagePath,
          isSelected: selectedCar == imagePath,
          onPressed: onPressed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('F1 Pal Jank Racing Sim'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '/images/tracks/f1GrandPrixDeMONACO24_tracks_stats.png',
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCarOption(
                        'assets/images/cars/pitstop_car_3.png',
                        () {
                          setState(() {
                            selectedCar = 'pitstop_car_3.png';
                          });
                        },
                      ),
                      buildCarOption(
                        'assets/images/cars/pitstop_car_1.png',
                        () {
                          setState(() {
                            selectedCar = 'pitstop_car_1.png';
                          });
                        },
                      ),
                      buildCarOption(
                        'assets/images/cars/pitstop_car_18.png',
                        () {
                          setState(() {
                            selectedCar = 'pitstop_car_18.png';
                          });
                        },
                      ),
                      buildCarOption(
                        'assets/images/cars/pitstop_car_2.png',
                        () {
                          setState(() {
                            selectedCar = 'pitstop_car_2.png';
                          });
                        },
                      ),
                      // Repeat the above block for each car option
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GameWidget(game: PalRacingGame(selectedCar)),
                      ),
                    );
                  },
                  child: Text('Begin Race'),
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

  const CarOption({
    Key? key,
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2)
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(imagePath, width: screenWidth * 0.2),
      ),
    );
  }
}
