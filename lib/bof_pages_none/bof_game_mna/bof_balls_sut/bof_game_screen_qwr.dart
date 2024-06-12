import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_anim_dialog_nga.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_win_alert_ytw.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_balls_sut/bof_block_kha.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BOFGameScreenVNB extends StatefulWidget {
  final int level;
  const BOFGameScreenVNB({
    super.key,
    required this.level,
  });

  @override
  State<BOFGameScreenVNB> createState() => _BOFGameScreenVNBState();
}

class _BOFGameScreenVNBState extends State<BOFGameScreenVNB> {
  final block = BOFBlockGameOIA();

  @override
  void initState() {
    win.addListener(() async {
      if (!win.value) {
        block.rel();
        win.value = false;
        BOFAppConvertHIYQ.fosgetCoinBUYQ(widget.level * 10 + 10, context);
        showDialog(
          context: context,
          builder: (context) {
            return BOFAnimDialogGTQ(
              content: BOFWinAlertNIU(
                fromGame: true,
                coin: widget.level * 10 + 10,
              ),
            );
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BOFCustomAppBarNBZ(),
            SizedBox(
              width: 310,
              height: 310,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: GameWidget(game: block),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                block.rel();
              },
              child: Container(
                width: 108,
                height: 108,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/reld_button.png'))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
