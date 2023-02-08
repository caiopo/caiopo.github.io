import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:personal_site_reborn/game.dart';

class Player extends SpriteAnimationComponent with HasGameRef<SiteGame> {
  Player({
    required super.position,
  }) : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    final image = await game.images.load('sprites/people/soldier.png');
    size = image.size;
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 4 * 9,
        amountPerRow: 9,
        stepTime: 0.40,
        textureSize: Vector2(64, 64),
      ),
    );
  }
}
