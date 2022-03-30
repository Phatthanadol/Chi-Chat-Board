import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:td_games/game/pexel_world.dart';
import 'package:td_games/game/components/background.dart';

class Pexelworld extends FlameGame {
  static final Vector2 resolution = Vector2(1920, 1080);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewport = FixedResolutionViewport(
      Vector2(resolution.x, resolution.y),
    );

    await add(Background());

    
  }
}
