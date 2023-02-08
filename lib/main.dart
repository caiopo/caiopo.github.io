import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:personal_site_reborn/game.dart';

void main() {
  runApp(
    GameWidget.controlled(
      gameFactory: () => SiteGame(),
    ),
  );
}
