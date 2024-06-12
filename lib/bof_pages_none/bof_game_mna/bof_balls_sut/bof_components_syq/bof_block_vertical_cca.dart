// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import '../bof_block_kha.dart';

class BOFBlockUniversalTRQ extends SpriteComponent
    with HasGameRef<BOFBlockGameOIA>, DragCallbacks {
  final Vector2 pos;
  final String spr;
  final bool bl;
  BOFBlockUniversalTRQ(this.pos, this.spr, this.bl)
      : super(
            size: Vector2(1 * 62 - 4, 1 * 62 - 4),
            position: Vector2(pos.x * 62 + 1, pos.y * 62 + 1));

  Map<String, List<String>> connections = {
    'block_start.png': ['right'],
    'block_end.png': ['left'],
    'block_all.png': ['left', 'right', 'up', 'down'],
    'block_left_bottom.png': ['left', 'down'],
    'block_left_top.png': ['left', 'up'],
    'block_top_right.png': ['up', 'right'],
    'block_right_bottom.png': ['right', 'down'],
    'block_horizontal.png': ['left', 'right'],
    'block_vertical.png': ['up', 'down'],
    'block_pusto.png': []
  };

  late final MySpecialHitbox utilityHitbox;
  @override
  Future<void> onLoad() async {
    utilityHitbox = MySpecialHitbox();
    add(utilityHitbox);
    sprite = await gameRef.loadSprite(spr);
    size = Vector2(1 * 62 - 4, 1 * 62 - 4);
    return super.onLoad();
  }

  List<String> getDirections() {
    return connections[spr] ?? [];
  }

  double lastDx = 0;
  double lastDy = 0;
  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (!bl) {
      priority = 2;

      if (utilityHitbox.isColliding) {
      } else {
        if (event.delta.y.abs() > event.delta.x.abs()) {
          double newX = (position.x + 0).clamp(-160 + 160, 160 - 1 * 62 + 160);
          double newY = (position.y + event.delta.y)
              .clamp(-160 + 160, 160 - 1 * 62 + 160);
          position = Vector2(newX, newY);
        } else {
          double newX = (position.x + event.delta.x)
              .clamp(-160 + 160, 160 - 1 * 62 + 160);
          double newY = (position.y + 0).clamp(-160 + 160, 160 - 1 * 62 + 160);
          position = Vector2(newX, newY);
        }

        lastDx = event.delta.x;
        lastDy = event.delta.y;
      }
    }

    super.onDragUpdate(event);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    priority = 0;

    double x = (position.x / 62).round().toDouble();
    double y = (position.y / 62).round().toDouble();
    position = Vector2(x * 62 + 1, y * 62 + 1);

    super.onDragEnd(event);
    super.onDragEnd(event);
  }
}

class MySpecialHitbox extends RectangleHitbox {
  MySpecialHitbox() {
    triggersParentCollision = false;
  }
}
