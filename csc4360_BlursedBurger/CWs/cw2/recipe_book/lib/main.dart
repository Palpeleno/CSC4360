import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'recipe_model.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(recipes: recipes),
    );
  }

  final List<Recipe> recipes = [
    Recipe(
      name: 'oven fired chicken wings',
      ingredients: 'Ingredient 1, Ingredient 2',
      instructions: 'Step 1\n, Step 2\n',
    ),
    Recipe(
      name: " chicken 65",
      ingredients: 'ingredients',
      instructions: 'instructions',
    ),
    // Add more recipes as needed
  ];
}
