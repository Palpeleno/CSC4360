// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/experimental.dart';
// import 'package:flame/game.dart';
// import 'package:flame/input.dart';
// import 'package:flame/parallax.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(GameWidget(game: SpaceShooterGame('default_rocket.png')));
// }

// class SpaceShooterGame extends FlameGame
//     with PanDetector, HasCollisionDetection {
//   late Player player;
//   final String selectedRocket;

//   SpaceShooterGame(this.selectedRocket);

//   @override
//   Future<void> onLoad() async {
//     final parallax = await loadParallaxComponent(
//       [
//         ParallaxImageData('stars_2.png'),
//         ParallaxImageData('stars_2.png'),
//         ParallaxImageData('stars_2.png'),
//       ],
//       baseVelocity: Vector2(0, -5),
//       repeat: ImageRepeat.repeat,
//       velocityMultiplierDelta: Vector2(0, 5),
//     );
//     add(parallax);

//     player = Player(selectedRocket);
//     add(player);

//     add(
//       SpawnComponent(
//         factory: (index) {
//           return Enemy();
//         },
//         period: 1,
//         area: Rectangle.fromLTWH(0, 0, size.x, -Enemy.enemySize),
//       ),
//     );
//   }
//   @override
//   void onPanUpdate(DragUpdateInfo info) {
//     player.move(info.delta.global);
//   }

//   @override
//   void onPanStart(DragStartInfo info) {
//     player.startShooting();
//   }

//   @override
//   void onPanEnd(DragEndInfo info) {
//     player.stopShooting();
//   }
// }

// class Player extends SpriteAnimationComponent
//     with HasGameReference<SpaceShooterGame> {
//   Player(String playerImagePath)
//       : super(
//           size: Vector2(100, 150),
//           anchor: Anchor.center,
//         ) {
//     _loadPlayerSprite(playerImagePath);
//   }

//   late final SpawnComponent _bulletSpawner;

//   Future<void> _loadPlayerSprite(String playerImagePath) async {
//     await super.onLoad();

//     animation = await game.loadSpriteAnimation(
//       playerImagePath,
//       SpriteAnimationData.sequenced(
//         amount: 1,
//         stepTime: 1.0,
//         textureSize: Vector2(2048, 2048),
//         texturePosition: Vector2.zero(),
//       ),
//     );

//     position = game.size / 2;

//     _bulletSpawner = SpawnComponent(
//       period: 1,
//       selfPositioning: true,
//       factory: (index) {
//         return Bullet(
//           position: position +
//               Vector2(
//                 0,
//                 -height / 2,
//               ),
//         );
//       },
//       autoStart: false,
//     );

//     game.add(_bulletSpawner);
//   }

//   void move(Vector2 delta) {
//     position.add(delta);
//   }

//   void startShooting() {
//     _bulletSpawner.timer.start();
//   }

//   void stopShooting() {
//     _bulletSpawner.timer.stop();
//   }
// }

// class Bullet extends SpriteAnimationComponent
//     with HasGameReference<SpaceShooterGame> {
//   Bullet({
//     super.position,
//   }) : super(
//           size: Vector2(25, 50),
//           anchor: Anchor.center,
//         );

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();

//     animation = await game.loadSpriteAnimation(
//       'bullet2.png',
//       SpriteAnimationData.sequenced(
//         amount: 4,
//         stepTime: .2,
//         textureSize: Vector2(400, 400),
//       ),
//     );

//     add(
//       RectangleHitbox(
//         collisionType: CollisionType.passive,
//       ),
//     );
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     position.y += dt * -500;

//     if (position.y < -height) {
//       removeFromParent();
//     }
//   }
// }

// class Enemy extends SpriteAnimationComponent
//     with HasGameReference<SpaceShooterGame>, CollisionCallbacks {
//   Enemy({
//     super.position,
//   }) : super(
//           size: Vector2.all(enemySize),
//           anchor: Anchor.center,
//         );

//   static const enemySize = 40.0;

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();

//     animation = await game.loadSpriteAnimation(
//       'enemy.png',
//       SpriteAnimationData.sequenced(
//         amount: 1,
//         stepTime: .234,
//         textureSize: Vector2(3693, 4421),
//       ),
//     );

//     add(RectangleHitbox());
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     position.y += dt * 250;

//     if (position.y > game.size.y) {
//       removeFromParent();
//     }
//   }

//   @override
//   void onCollisionStart(
//     Set<Vector2> intersectionPoints,
//     PositionComponent other,
//   ) {
//     super.onCollisionStart(intersectionPoints, other);

//     if (other is Bullet) {
//       removeFromParent();
//       other.removeFromParent();
//       game.add(Explosion(position: position));
//     }
//   }
// }

// class Explosion extends SpriteAnimationComponent
//     with HasGameReference<SpaceShooterGame> {
//   Explosion({
//     super.position,
//   }) : super(
//           size: Vector2.all(150), //maybeeeeeeeeeeeeeeee
//           anchor: Anchor.center,
//           removeOnFinish: true,
//         );

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();

//     animation = await game.loadSpriteAnimation(
//       'explosion.png',
//       SpriteAnimationData.sequenced(
//         amount: 6,
//         stepTime: .1,
//         textureSize: Vector2(800, 779),
//         loop: false,
//       ),
//     );
//   }
// }
