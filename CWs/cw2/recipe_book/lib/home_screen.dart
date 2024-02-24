// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'recipe_model.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes; // Accept the list of recipes as a parameter
  HomeScreen({required this.recipes});
  // get Recipes => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Catalog'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(50.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                      recipe: recipes[index]), // Pass the entire Recipe object
                ),
              );
            },
          );
        },
      ),
    );
  }
}
