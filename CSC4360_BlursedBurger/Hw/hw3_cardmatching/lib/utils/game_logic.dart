class Game {
  final String hiddenCardpath = 'assets/img/back_card_yugioh.png';
  List<String>? gameImg;

  // matching card faces
  final List<String> card_list = [
    // 1st set
    "assets/img/ODST_Virgil_3.png",
    "assets/img/ODST_Virgil_4.png",
    "assets/img/ODST_Virgil_9.png",
    "assets/img/ODST_Virgil_7.png",
    "assets/img/ODST_Virgil_5.png",
    "assets/img/ODST_Virgil_1.png",
    "assets/img/ODST_Virgil_10.png",
    "assets/img/ODST_Virgil_2.png",
    "assets/img/ODST_Virgil_6.png",
    "assets/img/ODST_Virgil_8.png",
    // 2nd  set
    "assets/img/ODST_Virgil_2.png",
    "assets/img/ODST_Virgil_9.png",
    "assets/img/ODST_Virgil_4.png",
    "assets/img/ODST_Virgil_1.png",
    "assets/img/ODST_Virgil_3.png",
    "assets/img/ODST_Virgil_5.png",
    "assets/img/ODST_Virgil_7.png",
    "assets/img/ODST_Virgil_8.png",
    "assets/img/ODST_Virgil_10.png",
    "assets/img/ODST_Virgil_6.png",
  ];
  // stroes the first clecked card and checks if they match
  List<Map<int, String>> matchCheck = [];

  final int cardCount = 20;

  //init the game

  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
