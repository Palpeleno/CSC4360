import 'package:cw5_2dracesim/game/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class PalRacingGame extends FlameGame with PanDetector {
  late Player player1;
  Offset? _pointerStartPosition;

  final String sprite1Path = 'cars_ext/pitstop_car_2.png';
  final String sprite2Path = 'cars_ext/pitstop_car_5.png';

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

    final sprite2Image = await Flame.images.load(sprite2Path);
    final sprite2 = Sprite(sprite2Image);

    // // final sprite2_2 = await Flame.images.load('pitstop_car_5_left.png');
    // // final sprite2_3 = await Flame.images.load('pitstop_car_5_right.png');

    player1 = Player(
      sprite: sprite1,
      size: Vector2(64, 112),
      position: Vector2(350, 725),
      angle: radians(180),
      anchor: Anchor.center,
    );

    Player player2 = Player(
      sprite: sprite2,
      size: Vector2(64, 112),
      position: Vector2(250, 725),
      angle: radians(180),
      anchor: Anchor.center,
    );

    // add sprites to game
    add(player1);
    // add(player2);
  }
  // user input for movment using touch gestrure

  void onPanStart(DragStartInfo info) {
    _pointerStartPosition = info.raw.globalPosition;

    print('pan start');
  }

  void onPanUpdate(DragUpdateInfo info) {
    final pointerCurrentPostion = info.raw.globalPosition;

    var delta = pointerCurrentPostion - _pointerStartPosition!;
    player1.setMoveDirection(Vector2(delta.dx, delta.dy));
    print('pan update');
  }

  void onPanEnd(DragEndInfo info) {
    _pointerStartPosition = null;
    player1.setMoveDirection(Vector2.zero());
  }

  void onPanCancel() {
    _pointerStartPosition = null;
    player1.setMoveDirection(Vector2.zero());
  }
}
