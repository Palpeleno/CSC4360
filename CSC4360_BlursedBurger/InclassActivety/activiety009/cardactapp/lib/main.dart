// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cardhandgame/card_service.dart';
import 'package:flutter/material.dart';
import './card_photo_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CardService _cardService = CardService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cards Activity App'),
          ),
          body: CardListWidget(cardService: _cardService),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigate to a screen to add a new card
              // You can use Navigator.push and MaterialPageRoute for navigation
            },
            child: Icon(Icons.add),
          ),
          drawer: Stack()),
    );
  }
}

class CardListWidget extends StatelessWidget {
  final CardService cardService;

  const CardListWidget({super.key, required this.cardService});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardService.hand.length,
      itemBuilder: (context, index) {
        return CardWidget(
          card: cardService.hand[index],
          onDelete: () {
            cardService.deleteCard(index);
          },
          onUpdate: (updatedCard) {
            cardService.updateCard(index, updatedCard);
          },
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final CardModel card;
  final VoidCallback onDelete;
  final Function(CardModel) onUpdate;

  const CardWidget(
      {super.key,
      required this.card,
      required this.onDelete,
      required this.onUpdate});

  // Future<Widget> addCard(BuildContext context) async {
  //   return Scaffold();
  //   // Implement UI for displaying card details
  // }

  // Future<Widget> updateCard(BuildContext context) async {
  //   return Scaffold();
  //   // You can include options for updating cards
  // }

  // Future<Widget> deleteCard(BuildContext context) async {
  //   return Scaffold();
  //   //You can include options for deleting cards
  // }

  // @override
  // Future<Widget> CardService(BuildContext context) async {
  //   gridView() {
  //     return Padding(
  //       padding: EdgeInsets.all(5.0),
  //       child: GridView.count(
  //         crossAxisCount: 2,
  //         childAspectRatio: 1.0,
  //         mainAxisSpacing: 4.0,
  //         crossAxisSpacing: 4.0,
  //         children: images.map((photo) {
  //           print("photo name");
  //           print(photo.photoName);
  //           return Utility.imageFromBase64String(photo.photoName ?? "");
  //         }).toList(),
  //       ),
  //     );
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
