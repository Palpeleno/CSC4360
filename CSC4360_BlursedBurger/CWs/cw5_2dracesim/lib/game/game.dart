import 'package:cw5_2dracesim/game/knows_game_size.dart';
import 'package:cw5_2dracesim/game/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PalRacingGame extends FlameGame with PanDetector {
  late Player player1;
  Offset? _pointerStartPosition;
  Offset? _pointerCurrentPosition;
  final double _joystickRadius = 60;
  final double _deadZoneRadius = 9;

  final String sprite1Path = 'cars_ext/pitstop_car_12.png';
  final String sprite2Path = 'cars_ext/pitstop_car_1.png';

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
      size: Vector2(85, 200),
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

  // draw joystick controller,
  // TODO adjust so instead of joy stick its stearing wheel with left and right input
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // outer  joystick
    if (_pointerStartPosition != null) {
      canvas.drawCircle(
        _pointerStartPosition!,
        _joystickRadius,
        Paint()..color = Colors.grey.withAlpha(100),
      );
    }
    // inner joystick
    if (_pointerCurrentPosition != null) {
      var delta = _pointerCurrentPosition! - _pointerStartPosition!;

      if (delta.distance > _joystickRadius) {
        // obtains distance of outer circle from inner circle
        delta = _pointerStartPosition! +
            (Vector2(delta.dx, delta.dy).normalized() * _joystickRadius)
                .toOffset();
      } else {
        delta = _pointerCurrentPosition!;
      }

      canvas.drawCircle(
        delta,
        15,
        Paint()..color = Colors.white.withAlpha(100),
      );
    }
  }

  // user input for movment using touch gestrure

  void onPanStart(DragStartInfo info) {
    _pointerStartPosition = info.raw.globalPosition;

    print('pan start');
  }

  void onPanUpdate(DragUpdateInfo info) {
    print('pan update');
    _pointerCurrentPosition = info.raw.globalPosition;

    var delta = _pointerCurrentPosition! - _pointerStartPosition!;
    player1.setMoveDirection(Vector2(delta.dx, delta.dy));

    // deadzone for joystick
    if (delta.distance > _deadZoneRadius) {
      player1.setMoveDirection(Vector2(delta.dx, delta.dy));
    } else {
      player1.setMoveDirection(Vector2.zero());
    }
  }

  void onPanEnd(DragEndInfo info) {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
    player1.setMoveDirection(Vector2.zero());
    print('pan end');
  }

  void onPanCancel() {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
    player1.setMoveDirection(Vector2.zero());
    print('pan cancel');
  }

  @override
  void prepare(Component c) {
    prepare(c);

    if (c is KnowsGameSize) {
      c.onGameResize(this.size);
    }
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onParentResize(this.size);

    this.componentsAtLocation(locationContext, nestedContexts, (p0, p1) => null, (p0, p1) => false).whereType<KnowsGameSize>().forEach(
      (component) {
        component.onResize(this.size);
      },
    );
  }
}
