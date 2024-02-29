import 'dart:collection';
import './card_photo_helper.dart';

class CardService {
  List<CardModel> _hand = [];

  UnmodifiableListView<CardModel> get hand => UnmodifiableListView(_hand);

  void addCard(CardModel card) {
    _hand.add(card);
  }

  void updateCard(int index, CardModel updatedCard) {
    if (index >= 0 && index < _hand.length) {
      _hand[index] = updatedCard;
    }
  }

  void deleteCard(int index) {
    if (index >= 0 && index < _hand.length) {
      _hand.removeAt(index);
    }
  }
}
