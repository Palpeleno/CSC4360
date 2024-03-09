import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/parallax.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<PalRacingGame> {
  Player()
      : super(
          // size: Vector2(56.42, 154.75),
          size: Vector2(378, 971),

          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      '../images/cars_ext/pitstop_car_12.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2(32, 48),
      ),
    );
    position = game.size / 2;
  }
}

class PalRacingGame extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('tracks/racer_track'),
        ParallaxImageData('tracks/src/asphalt.svg'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);

    player = Player();
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    // player.move(info.delta.global);
  }
}

void main() {
  runApp(
    GameWidget(
      game: PalRacingGame(),
    ),
  );
}
