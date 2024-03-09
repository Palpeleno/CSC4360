import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:cw5_2dracesim/game/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // makes game launch in fullscreen
  Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: PalRacingGame(),
    ),
  );
}
