import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

void main() {
  runApp(GameWidget(game: PalRacingGame('pitstop_car_3.png')));
}

class PalRacingGame extends FlameGame with PanDetector, HasCollisionDetection {
  late Player player;
  final String selectedCar;
  PalRacingGame(this.selectedCar);

  @override
  Future<void> onLoad() async {
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('tracks/race_track.png'), // Remove the leading slash
      ],
      baseVelocity: Vector2(0, -300),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);

    player = Player(selectedCar);
    add(player);

    add(
      SpawnComponent(
        factory: (index) {
          return Enemy();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -Enemy.enemySize),
      ),
    );
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }

  @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
  }
}

class Player extends SpriteAnimationComponent
    with HasGameReference<PalRacingGame> {
  Player(String playerImagePath)
      : super(
          size: Vector2(66.375, 182.0625),
          anchor: Anchor.center,
        ) {
    _loadPlayerSprite(playerImagePath);
  }

  late final SpawnComponent _bulletSpawner;

  Future<void> _loadPlayerSprite(playerImagePath) async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      playerImagePath,
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 1.0,
        textureSize: Vector2(354, 971),
      ),
    );

    position = game.size / 2;
    _bulletSpawner = SpawnComponent(
      period: 1,
      selfPositioning: true,
      factory: (index) {
        return Bullet(
          position: position +
              Vector2(
                0,
                -height / 2,
              ),
        );
        //return bullet;
      },
      autoStart: false,
    );
    game.add(_bulletSpawner);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }
}

class Bullet extends SpriteAnimationComponent
    with HasGameReference<PalRacingGame> {
  Bullet({
    super.position,
  }) : super(
          size: Vector2(15, 15),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      '../../images/actionstuff/megaman_bullet.png',
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: .1,
        textureSize: Vector2(500, 500),
      ),
    );

    add(
      RectangleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * -500;

    if (position.y < -height) {
      removeFromParent();
    }
  }
}

class Enemy extends SpriteAnimationComponent
    with HasGameReference<PalRacingGame>, CollisionCallbacks {
  Enemy({
    super.position,
  }) : super(
          size: Vector2.all(enemySize),
          anchor: Anchor.center,
        );

  static const enemySize = 100.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // print('Enemy loaded'); //debug

    animation = await game.loadSpriteAnimation(
      'hazards/oil-spill.png',
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: .5,
        textureSize: Vector2(100, 100),
      ),
    );

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 250;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Bullet) {
      removeFromParent();
      other.removeFromParent();
    }
  }
}
