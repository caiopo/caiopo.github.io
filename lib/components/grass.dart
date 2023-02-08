import 'package:flame/components.dart';

class Grass extends SpriteComponent {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('tiles/barrel.png');
    size = sprite!.srcSize;
  }


}
