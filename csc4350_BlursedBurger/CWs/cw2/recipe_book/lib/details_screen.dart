import 'package:flutter/material.dart';
import 'recipe_model.dart';

// ignore_for_file: prefer_const_constructors
class DetailsScreen extends StatelessWidget {
  final Recipe recipe; // The selected recipe name received from HomeScreen

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients: ${recipe.ingredients}'),
            SizedBox(height: 16),
            Text('Instructions: ${recipe.instructions}'),
          ],
        ),
      ),
    );
  }
}
