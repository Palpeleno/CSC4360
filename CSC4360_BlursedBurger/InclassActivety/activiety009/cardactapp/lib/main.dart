// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'card_model.dart';
import 'card_service.dart';

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
      ),
    );
  }
}

class CardListWidget extends StatelessWidget {
  final CardService cardService;

  CardListWidget({required this.cardService});

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

  CardWidget(
      {required this.card, required this.onDelete, required this.onUpdate});

  @override
  Future<Widget> cardUI(BuildContext context) async {
    return Scaffold();
    //   // Implement UI for displaying card details
    //   // You can include options for updating and deleting cards
  }

  @override
  Future<Widget> handSelecter(BuildContext context) async {
    return Scaffold();
    //   // Implement UI for displaying card details
    //   // You can include options for updating and deleting cards
  }

  @override
  Future<Widget> deleteCards(BuildContext context) async {
    return Scaffold();
    //   // Implement UI for displaying card details
    //   // You can include options for updating and deleting cards
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
