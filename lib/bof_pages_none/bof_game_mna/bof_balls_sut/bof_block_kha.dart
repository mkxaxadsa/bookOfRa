import 'dart:async';
import 'dart:math';

import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_balls_sut/bof_components_syq/bof_block_vertical_cca.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<bool> win = ValueNotifier(false);

class BOFBlockGameOIA extends FlameGame with HasCollisionDetection {
  List<BOFBlockUniversalTRQ> blocks = [];
  @override
  FutureOr<void> onLoad() {
    add(BackGame());
    int gridSize = 5;
    List<Vector2> randomCells = generateRandomCells(gridSize);
    List<String> randomBlocks = generateRandomBlockArray();

    var bl = BOFBlockUniversalTRQ(randomCells.first, 'block_start.png', true);
    blocks.add(bl);
    add(bl);
    for (int i = 1; i < 21; i++) {
      var block =
          BOFBlockUniversalTRQ(randomCells[i], randomBlocks[i - 1], false);
      blocks.add(block);
      add(block);
    }
    var blend = BOFBlockUniversalTRQ(randomCells.last, 'block_end.png', true);
    blocks.add(blend);
    add(blend);

    return super.onLoad();
  }

  void rel() {
    for (var blocf in blocks) {
      blocf.removeFromParent();
    }
    blocks = [];
    int gridSize = 5;
    List<Vector2> randomCells = generateRandomCells(gridSize);
    List<String> randomBlocks = generateRandomBlockArray();

    var bl = BOFBlockUniversalTRQ(randomCells.first, 'block_start.png', true);
    blocks.add(bl);
    add(bl);
    for (int i = 1; i < 21; i++) {
      var block =
          BOFBlockUniversalTRQ(randomCells[i], randomBlocks[i - 1], false);
      blocks.add(block);
      add(block);
    }
    var blend = BOFBlockUniversalTRQ(randomCells.last, 'block_end.png', true);
    blocks.add(blend);
    add(blend);
  }

  List<Vector2> getBlockPositions() {
    return blocks.map((block) {
      // Create a new Vector2 with incremented x and y values
      return Vector2((block.position.x - 1) / 62, (block.position.y - 1) / 62);
    }).toList();
  }

  @override
  void update(double dt) {
    if (isPathComplete()) {
      win.value = true;
    }
    super.update(dt);
  }

  bool isPathComplete() {
    Map<Vector2, BOFBlockUniversalTRQ> blockMap = {
      for (var block in blocks) block.position: block
    };
    //print(blockMap);
    Set<Vector2> visited = {};

    Vector2 start = Vector2(0 * 62 + 1, 0 * 62 + 1);
    Vector2 end = Vector2(4 * 62 + 1, 4 * 62 + 1);
    //print(blockMap[start]);

    return dfs(start, end, blockMap, visited);
  }

  bool dfs(Vector2 current, Vector2 end,
      Map<Vector2, BOFBlockUniversalTRQ> blockMap, Set<Vector2> visited) {
    if (current == end) return true;
    if (visited.contains(current)) {
      return false;
    }

    visited.add(current);
    BOFBlockUniversalTRQ? currentBlock = blockMap[current];
    if (currentBlock == null) {
      return false;
    }

    for (var direction in currentBlock.getDirections()) {
      Vector2 next;

      switch (direction) {
        case 'left':
          next = Vector2(current.x - 62, current.y);
          break;
        case 'right':
          next = Vector2(current.x + 62, current.y);
          break;
        case 'up':
          next = Vector2(current.x, current.y - 62);
          break;
        case 'down':
          next = Vector2(current.x, current.y + 62);
          break;
        default:
          continue;
      }
      //print(next);
      if (dfs(next, end, blockMap, visited)) {
        return true;
      }
    }

    return false;
  }
}

class BackGame extends SpriteComponent with HasGameRef<BOFBlockGameOIA> {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('game_back.png');
    size = Vector2(gameRef.size.x, gameRef.size.y);
    return super.onLoad();
  }
}

List<Vector2> generateRandomCells(int gridSize) {
  List<Vector2> cells = [];
  Random random = Random();

  // Create a list of all possible cell positions except (0,0) and (4,4)
  List<Vector2> allCells = [];
  for (int x = 0; x < gridSize; x++) {
    for (int y = 0; y < gridSize; y++) {
      if (!(x == 0 && y == 0) && !(x == 4 && y == 4)) {
        allCells.add(Vector2(x.toDouble(), y.toDouble()));
      }
    }
  }

  // Shuffle the list to get random positions
  allCells.shuffle(random);

  // Add (0,0) at the beginning and (4,4) at the end
  cells.add(Vector2(0, 0));
  cells.addAll(allCells);
  cells.add(Vector2(4, 4));

  return cells;
}

List<String> generateRandomBlockArray() {
  List<String> blocks = [
    'block_top_right.png',
    'block_top_right.png',
    'block_left_bottom.png',
    'block_left_bottom.png',
    'block_left_bottom.png',
    'block_left_top.png',
    'block_left_top.png',
    'block_left_top.png',
    'block_top_right.png',
    'block_right_bottom.png',
    'block_right_bottom.png',
    'block_right_bottom.png',
    'block_horizontal.png',
    'block_horizontal.png',
    'block_horizontal.png',
    'block_vertical.png',
    'block_vertical.png',
    'block_vertical.png',
    'block_pusto.png',
    'block_pusto.png'
  ];

  blocks.shuffle(Random());

  return blocks;
}
