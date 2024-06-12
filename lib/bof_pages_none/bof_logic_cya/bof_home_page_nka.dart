import 'dart:async';

import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_nav_vqd.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_button_yta.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_coin_container_ita.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_daily_bonus_page_duf.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_select_game_page_daq.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_shop_page_hia.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFHomePageLOA extends StatefulWidget {
  const BOFHomePageLOA({super.key});

  @override
  State<BOFHomePageLOA> createState() => _BOFHomePageLOAState();
}

class _BOFHomePageLOAState extends State<BOFHomePageLOA> {
  int? different;
  late Timer timer;

  late SharedPreferences _sharedPreferences;
  int _coin = 0;

  late bool _backgroundSoundActive;
  late Bgm _bgm;
  @override
  void initState() {
    _sharedPreferences = context.read<SharedPreferences>();
    load();
    _bgm = context.read<Bgm>();

    _backgroundSoundActive =
        _sharedPreferences.getBool("backgroundSound") ?? false;

    String? lastTimeGiftString = _sharedPreferences.getString("gift");
    if (lastTimeGiftString != null) {
      DateTime now = DateTime.now();
      DateTime nextGiftTime = DateTime.parse(lastTimeGiftString);
      different = nextGiftTime.difference(now).inSeconds;
      if (different! <= 0) {
        different = null;
      }
    }

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (different != null) {
            different = different! - 1;
          }
        });
      },
    );

    super.initState();
  }

  void changeSound(bool make) async {
    if (!make) {
      await _sharedPreferences.setBool(
        "backgroundSound",
        false,
      );
      await _bgm.pause();
    } else {
      await _sharedPreferences.setBool(
        "backgroundSound",
        true,
      );
      await _bgm.resume();
    }

    _backgroundSoundActive = !_backgroundSoundActive;
    setState(() {});
  }

  void load() {
    _coin = _sharedPreferences.getInt("coin") ?? 0;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void reset() {
    DateTime nextGiftTime = DateTime.now().add(const Duration(days: 1));
    _sharedPreferences.setString("gift", nextGiftTime.toString());
    different = nextGiftTime.difference(DateTime.now()).inSeconds;
  }

  String getBonusText() {
    return different == null
        ? "BONUS"
        : BOFAppConvertHIYQ.fosconvertTimerFormatBGT(
            Duration(seconds: different!),
          );
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(
        context: context,
        isHome: true,
      ),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.r,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        changeSound(_backgroundSoundActive);
                      },
                      child: Image.asset(
                        _backgroundSoundActive
                            ? Images.soundOff
                            : Images.soundOn,
                        height: 74.r,
                      ),
                    ),
                    BOFCoinContainerGYQ(coin: _coin),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BOFAppButtonGYA(
                title: "GAMES",
                onTap: () async {
                  await FOSAppNavVQE.fospushPageBGA(
                      const BOFSelectGamePagehUQA(), context);
                  load();
                },
              ),
              SizedBox(height: 40.r),
              BOFAppButtonGYA(
                title: "SHOP",
                onTap: () async {
                  await FOSAppNavVQE.fospushPageBGA(
                      const BOFShopPagejQA(), context);
                  load();
                },
              ),
              SizedBox(height: 40.r),
              BOFAppButtonGYA(
                title: getBonusText(),
                onTap: () async {
                  if (different == null) {
                    await FOSAppNavVQE.fospushPageBGA(
                        const BOFDailyBonusPageHIYQ(), context);
                    load();
                    reset();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
