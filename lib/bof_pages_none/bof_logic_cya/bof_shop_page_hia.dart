import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_messages_naq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_button_yta.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_coin_container_ita.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_shop_container_fda.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFShopPagejQA extends StatefulWidget {
  const BOFShopPagejQA({super.key});

  @override
  State<BOFShopPagejQA> createState() => _BOFShopPagejQAState();
}

class _BOFShopPagejQAState extends State<BOFShopPagejQA> {
  late SharedPreferences _sharedPreferences;
  late int _coin;
  late bool _haveBack2;
  late bool _haveBack3;
  late int _useBack;

  @override
  void initState() {
    _sharedPreferences = context.read<SharedPreferences>();
    load();
    super.initState();
  }

  load() {
    _coin = 0;
    _coin = _sharedPreferences.getInt("coin") ?? 0;
    _haveBack2 = _sharedPreferences.getBool("haveBack2") ?? false;
    _haveBack3 = _sharedPreferences.getBool("haveBack3") ?? false;
    _useBack = _sharedPreferences.getInt("useBack") ?? 0;

    setState(() {});
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
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: BOFAppButtonGYA(
                    title: "BACKGROUNDS",
                    onTap: () {},
                    textSize: 28,
                    horizontal: 20,
                  ),
                ),
                SizedBox(height: 22.r),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xff2C1809).withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.r),
                    child: SizedBox(
                      height: 300.r,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 20.r),
                          for (int i = 0; i < 3; i++)
                            Padding(
                              padding: EdgeInsets.only(right: 40.r),
                              child: Column(
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Center(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: const Color(0xffFCFF72),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.r),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                "assets/images/back_home_$i.png",
                                                width: 120.r,
                                                height: 194.r,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (!((i == 0) ||
                                          (i == 1 && _haveBack2) ||
                                          (i == 2 && _haveBack3)))
                                        Positioned(
                                          bottom: -20.r,
                                          child: const BOFCoinContainerGYQ(
                                              coin: 380),
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 30.r),
                                  i == _useBack
                                      ? Image.asset(
                                          Images.usedButton,
                                          width: 100.r,
                                        )
                                      : (i == 0) ||
                                              (i == 1 && _haveBack2) ||
                                              (i == 2 && _haveBack3)
                                          ? GestureDetector(
                                              onTap: () {
                                                _sharedPreferences.setInt(
                                                    "useBack", i);
                                                load();
                                              },
                                              child: Image.asset(
                                                Images.useButton,
                                                width: 100.r,
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                if (380 > _coin) {
                                                  FOSAppMessagesUIQ
                                                      .fosshowCustomMessageUTQ(
                                                    context,
                                                    "You don't have enough money.",
                                                  );
                                                } else {
                                                  BOFAppConvertHIYQ
                                                      .fosgetCoinBUYQ(
                                                          -380, context);
                                                  if (i == 1) {
                                                    _sharedPreferences.setBool(
                                                        "haveBack2", true);
                                                    load();
                                                  }
                                                  if (i == 2) {
                                                    _sharedPreferences.setBool(
                                                        "haveBack3", true);
                                                    load();
                                                  }
                                                }
                                              },
                                              child: Image.asset(
                                                Images.buyButton,
                                                width: 100.r,
                                              ),
                                            ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.r),
                Center(
                  child: BOFAppButtonGYA(
                    title: "OTHER",
                    onTap: () {},
                    textSize: 30,
                    horizontal: 20,
                  ),
                ),
                SizedBox(height: 22.r),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xff2C1809).withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.r),
                    child: SizedBox(
                      height: 300.r,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 20.r),
                          BOFShopContainerNBV(
                            onTap: () {},
                            texts: "+1 spin",
                            image: Images.shopSpin,
                          ),
                          BOFShopContainerNBV(
                            onTap: () async {
                              if (150 > _coin) {
                                FOSAppMessagesUIQ.fosshowCustomMessageUTQ(
                                  context,
                                  "You don't have enough money.",
                                );
                              } else {
                                BOFAppConvertHIYQ.fosgetCoinBUYQ(-150, context);
                                int oldMaxLevel =
                                    _sharedPreferences.getInt("maxConnect") ??
                                        2;
                                _sharedPreferences.setInt(
                                  "maxConnect",
                                  oldMaxLevel + 1,
                                );
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    load();
                                  },
                                );
                              }
                            },
                            texts: "+1 level",
                            image: Images.shopConnect,
                          ),
                          BOFShopContainerNBV(
                            onTap: () async {
                              if (150 > _coin) {
                                FOSAppMessagesUIQ.fosshowCustomMessageUTQ(
                                  context,
                                  "You don't have enough money.",
                                );
                              } else {
                                BOFAppConvertHIYQ.fosgetCoinBUYQ(-150, context);
                                int oldMaxLevel =
                                    _sharedPreferences.getInt("maxBlocks") ?? 2;
                                _sharedPreferences.setInt(
                                  "maxBlocks",
                                  oldMaxLevel + 1,
                                );
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    load();
                                  },
                                );
                              }
                            },
                            texts: "+1 level",
                            image: "assets/images/image 27.png",
                          ),
                          BOFShopContainerNBV(
                            onTap: () async {
                              if (150 > _coin) {
                                FOSAppMessagesUIQ.fosshowCustomMessageUTQ(
                                  context,
                                  "You don't have enough money.",
                                );
                              } else {
                                BOFAppConvertHIYQ.fosgetCoinBUYQ(-150, context);
                                int oldMaxLevel =
                                    _sharedPreferences.getInt("maxEscape") ?? 2;
                                _sharedPreferences.setInt(
                                  "maxEscape",
                                  oldMaxLevel + 1,
                                );
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    load();
                                  },
                                );
                              }
                            },
                            texts: "+1 level",
                            image: "assets/images/image 27 (1).png",
                          ),
                          BOFShopContainerNBV(
                            onTap: () async {
                              if (150 > _coin) {
                                FOSAppMessagesUIQ.fosshowCustomMessageUTQ(
                                  context,
                                  "You don't have enough money.",
                                );
                              } else {
                                BOFAppConvertHIYQ.fosgetCoinBUYQ(-150, context);
                                int oldMaxLevel = _sharedPreferences
                                        .getInt("maxbofSecondTRQ") ??
                                    2;
                                _sharedPreferences.setInt(
                                  "maxbofSecondTRQ",
                                  oldMaxLevel + 1,
                                );
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    load();
                                  },
                                );
                              }
                            },
                            texts: "+1 level",
                            image: "assets/images/image 27 (2).png",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
