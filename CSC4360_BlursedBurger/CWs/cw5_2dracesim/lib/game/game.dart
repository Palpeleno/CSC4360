import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class PalRacingGame extends FlameGame {
  final String sprite1Path = 'cars_ext/pitstop_car_2.png';
  // final String sprite2Path = 'cars_ext/pitstop_car_5.png';

  @override
  Future<void> onLoad() async {
    // TODO change this main driver sprite depending on user car selection
    // TODO create animations for when car is turning left or right with subsequent pitstop_car_#
    // TODO consider combining sprites to a single sprite sheet making retrival easier and faster

    // individual sprites
    final sprite1Image = await Flame.images.load(sprite1Path);
    final sprite1 = Sprite(sprite1Image);
    // final sprite1_2 = await Flame.images.load('pitstop_car_2_left.png');
    // final sprite1_3 = await Flame.images.load('pitstop_car_2_right.png');

    // final sprite2 = await Flame.images.load(sprite2Path);
    // // final sprite2_2 = await Flame.images.load('pitstop_car_5_left.png');
    // // final sprite2_3 = await Flame.images.load('pitstop_car_5_right.png');

    SpriteComponent player1 = SpriteComponent(
      sprite: sprite1,
      autoResize: true,
      scale: Vector2(.2, .2),
      angle: radians(180),
      anchor: Anchor.center,
    );

    //sprite components
    // final sprite1_2Component = SpriteComponent.fromImage(sprite1);

    //size sprites
    // player1.scale = Vector2(.16, .16);

    // position sprites
    player1.x = 350;
    player1.y = 650;

    // add sprites to game
    add(player1);
  }
}
