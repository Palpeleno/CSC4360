import 'package:cw5_2dracesim/game/knows_game_size.dart';
import 'package:flame/components.dart';

class Player extends SpriteComponent with KnowsGameSize {
  //
  Vector2 _moveDirection = Vector2.zero();

  double _speed = 250;

  Player({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
    double? angle,
    Anchor? anchor,
  }) : super(
            sprite: sprite,
            position: position,
            size: size,
            angle: angle,
            anchor: anchor);

  @override
  void update(double dt) {
    super.update(dt);

    // provides update of player in the general direction
    // dt = delta time, of movement of object manipulated by lpayer speed
    this.position += _moveDirection.normalized() * _speed * dt;
  }

  void setMoveDirection(Vector2 newMoveDirection) {
    _moveDirection = newMoveDirection;
  }
}
