class Game {
  final String hiddenCardpath = 'assets/img/back_card_yugioh.jpg';
  List<String>? gameImg;

  // matching card faces
  final List<String> card_list = [
    // 1st set
    "assets/img/ODST_Virgil_1.jpg",
    "assets/img/ODST_Virgil_2.jpg",
    "assets/img/ODST_Virgil_3.jpg",
    "assets/img/ODST_Virgil_4.jpg",
    "assets/img/ODST_Virgil_5.jpg",
    "assets/img/ODST_Virgil_6.jpg",
    "assets/img/ODST_Virgil_7.jpg",
    "assets/img/ODST_Virgil_8.jpg",
    "assets/img/ODST_Virgil_9.jpg",
    "assets/img/ODST_Virgil_10.jpg",
    // 2nd  set
    "assets/img/ODST_Virgil_1.jpg",
    "assets/img/ODST_Virgil_2.jpg",
    "assets/img/ODST_Virgil_3.jpg",
    "assets/img/ODST_Virgil_4.jpg",
    "assets/img/ODST_Virgil_5.jpg",
    "assets/img/ODST_Virgil_6.jpg",
    "assets/img/ODST_Virgil_7.jpg",
    "assets/img/ODST_Virgil_8.jpg",
    "assets/img/ODST_Virgil_9.jpg",
    "assets/img/ODST_Virgil_10.jpg",
  ];
  // stroes the first clecked card and checks if they match
  List<Map<int, String>> matchCheck = [];

  final int cardCount = 20;

  //init the game

  void initGame() {
    // TODO
    // gameImg = List.generate(card_list.length, (index) => hiddenCardpath);

    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
