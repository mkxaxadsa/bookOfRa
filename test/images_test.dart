import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:book_of_ra/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.back0).existsSync(), isTrue);
    expect(File(Images.back1).existsSync(), isTrue);
    expect(File(Images.back2).existsSync(), isTrue);
    expect(File(Images.backButton).existsSync(), isTrue);
    expect(File(Images.backHome0).existsSync(), isTrue);
    expect(File(Images.backHome1).existsSync(), isTrue);
    expect(File(Images.backHome2).existsSync(), isTrue);
    expect(File(Images.backSplash).existsSync(), isTrue);
    expect(File(Images.background).existsSync(), isTrue);
    expect(File(Images.blockAll).existsSync(), isTrue);
    expect(File(Images.blockEnd).existsSync(), isTrue);
    expect(File(Images.blockHorizontal).existsSync(), isTrue);
    expect(File(Images.blockLeftBottom).existsSync(), isTrue);
    expect(File(Images.blockLeftTop).existsSync(), isTrue);
    expect(File(Images.blockPusto).existsSync(), isTrue);
    expect(File(Images.blockRightBottom).existsSync(), isTrue);
    expect(File(Images.blockStart).existsSync(), isTrue);
    expect(File(Images.blockTopRight).existsSync(), isTrue);
    expect(File(Images.blockVertical).existsSync(), isTrue);
    expect(File(Images.book).existsSync(), isTrue);
    expect(File(Images.buyButton).existsSync(), isTrue);
    expect(File(Images.coin).existsSync(), isTrue);
    expect(File(Images.coin5).existsSync(), isTrue);
    expect(File(Images.coin6).existsSync(), isTrue);
    expect(File(Images.coin7).existsSync(), isTrue);
    expect(File(Images.coin8).existsSync(), isTrue);
    expect(File(Images.coinZero).existsSync(), isTrue);
    expect(File(Images.cont1).existsSync(), isTrue);
    expect(File(Images.cont2).existsSync(), isTrue);
    expect(File(Images.cont3).existsSync(), isTrue);
    expect(File(Images.cont4).existsSync(), isTrue);
    expect(File(Images.ellipse).existsSync(), isTrue);
    expect(File(Images.ellipseCon).existsSync(), isTrue);
    expect(File(Images.gameBack).existsSync(), isTrue);
    expect(File(Images.gameBlocs).existsSync(), isTrue);
    expect(File(Images.gameBoll).existsSync(), isTrue);
    expect(File(Images.gameConnect).existsSync(), isTrue);
    expect(File(Images.gameEscape).existsSync(), isTrue);
    expect(File(Images.grid).existsSync(), isTrue);
    expect(File(Images.image271_).existsSync(), isTrue);
    expect(File(Images.image272_).existsSync(), isTrue);
    expect(File(Images.image27).existsSync(), isTrue);
    expect(File(Images.loseAlert).existsSync(), isTrue);
    expect(File(Images.oneBlock).existsSync(), isTrue);
    expect(File(Images.reldButton).existsSync(), isTrue);
    expect(File(Images.resetButton).existsSync(), isTrue);
    expect(File(Images.selectBloc).existsSync(), isTrue);
    expect(File(Images.shine).existsSync(), isTrue);
    expect(File(Images.shopConnect).existsSync(), isTrue);
    expect(File(Images.shopSpin).existsSync(), isTrue);
    expect(File(Images.slot10).existsSync(), isTrue);
    expect(File(Images.slotA).existsSync(), isTrue);
    expect(File(Images.slotBook).existsSync(), isTrue);
    expect(File(Images.slotJ).existsSync(), isTrue);
    expect(File(Images.slotK).existsSync(), isTrue);
    expect(File(Images.slotQ).existsSync(), isTrue);
    expect(File(Images.soundOff).existsSync(), isTrue);
    expect(File(Images.soundOn).existsSync(), isTrue);
    expect(File(Images.spinButton).existsSync(), isTrue);
    expect(File(Images.twoBlock).existsSync(), isTrue);
    expect(File(Images.useButton).existsSync(), isTrue);
    expect(File(Images.usedButton).existsSync(), isTrue);
    expect(File(Images.winAlert).existsSync(), isTrue);
  });
}
