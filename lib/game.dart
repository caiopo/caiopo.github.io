import 'package:flame/game.dart';
import 'package:personal_site_reborn/components/grass.dart';
import 'package:personal_site_reborn/components/player.dart';

class SiteGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await add(Grass());
    await add(Player(position: Vector2(10, 10)));
  }
}
