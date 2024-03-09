import 'package:flame/components.dart';

mixin KnowsGameSize on Component {
  late Vector2 gameSize;

  void onGameResize(Vector2 newGameSize) {
    gameSize = newGameSize;
  }
}
