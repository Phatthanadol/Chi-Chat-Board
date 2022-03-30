import 'package:flame/components.dart';
import 'package:td_games/game/game.dart';
import 'package:td_games/game/pexel_world.dart';

class Background extends SpriteComponent with HasGameRef<Pexelworld> {
  Background()
      : super(
          size: Vector2(1920, 1080),
          priority: 1,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.center;

    sprite = await gameRef.loadSprite('background.png');
  }
}
