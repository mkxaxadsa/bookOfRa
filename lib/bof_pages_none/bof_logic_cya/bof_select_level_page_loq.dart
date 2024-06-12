// ignore_for_file: use_build_context_synchronously

import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_nav_vqd.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_button_yta.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_balls_sut/bof_game_screen_qwr.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_blocks_bat/bof_game_blocks_page_iou.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_connect_dfr/bof_game_connect_page_poq.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_escape_ewq/bof_game_escape_page_pqd.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_shop_page_hia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFSelectLevelPagePUQ extends StatefulWidget {
  final bool bOFGameConnectPageVYQ;
  final bool gameEscapetPage;
  final bool bOFGameBlocksPageNBA;
  final bool gameBallsPage;

  const BOFSelectLevelPagePUQ({
    super.key,
    this.bOFGameConnectPageVYQ = false,
    this.gameEscapetPage = false,
    this.bOFGameBlocksPageNBA = false,
    this.gameBallsPage = false,
  });

  @override
  State<BOFSelectLevelPagePUQ> createState() => _BOFSelectLevelPagePUQState();
}

class _BOFSelectLevelPagePUQState extends State<BOFSelectLevelPagePUQ> {
  late SharedPreferences _sharedPreferences;
  late int maxConnect;
  late int maxEscape;
  late int maxBlocks;
  late int maxBalls;
  late int _coin;
  @override
  void initState() {
    _sharedPreferences = context.read<SharedPreferences>();
    load();
    super.initState();
  }

  load() {
    maxConnect = _sharedPreferences.getInt("maxConnect") ?? 2;
    maxEscape = _sharedPreferences.getInt("maxEscape") ?? 2;
    maxBlocks = _sharedPreferences.getInt("maxBlocks") ?? 2;
    maxBalls = _sharedPreferences.getInt("maxBalls") ?? 2;

    _coin = _sharedPreferences.getInt("coin") ?? 0;
    setState(() {});
  }

  int getValue() {
    if (widget.gameBallsPage) {
      return maxBalls;
    }
    if (widget.bOFGameBlocksPageNBA) {
      return maxBlocks;
    }
    if (widget.bOFGameConnectPageVYQ) {
      return maxConnect;
    }
    if (widget.gameEscapetPage) {
      return maxEscape;
    }
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Column(
        children: [
          BOFCustomAppBarNBZ(
            coin: _coin,
          ),
          SizedBox(height: 20.r),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              children: [
                for (int i = 0; i < getValue(); i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.r),
                    child: BOFAppButtonGYA(
                      title: "LEVEL ${i + 1}",
                      onTap: () async {
                        if (widget.bOFGameConnectPageVYQ) {
                          await FOSAppNavVQE.fospushPageBGA(
                              BOFGameConnectPageVYQ(level: i), context);
                        }
                        if (widget.gameEscapetPage) {
                          await FOSAppNavVQE.fospushPageBGA(
                              GameEscapePage(level: i), context);
                        }
                        if (widget.bOFGameBlocksPageNBA) {
                          await FOSAppNavVQE.fospushPageBGA(
                              BOFGameBlocksPageNBA(level: i), context);
                        }
                        if (widget.gameBallsPage) {
                          await FOSAppNavVQE.fospushPageBGA(
                              BOFGameScreenVNB(
                                level: i,
                              ),
                              context);
                        }
                        load();
                      },
                    ),
                  ),
                BOFAppButtonGYA(
                  title: "BUY LEVEL",
                  onTap: () async {
                    await FOSAppNavVQE.fospushPageBGA(
                        const BOFShopPagejQA(), context);
                    load();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
