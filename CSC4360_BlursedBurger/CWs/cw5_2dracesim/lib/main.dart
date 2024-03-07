import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:cw5_2dracesim/game/game.dart';
import 'package:flame/game.dart';

void main() {
  // makes game launch in fullscreen
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: PalRacingGame(),
    ),
  );
}
