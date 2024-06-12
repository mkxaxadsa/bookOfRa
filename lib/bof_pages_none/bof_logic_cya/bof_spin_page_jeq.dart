import 'dart:math';

import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_anim_dialog_nga.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_lose_alert_ewq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_win_alert_ytw.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFSpinPageFYQA extends StatefulWidget {
  const BOFSpinPageFYQA({super.key});

  @override
  State<BOFSpinPageFYQA> createState() => _BOFSpinPageFYQAState();
}

class _BOFSpinPageFYQAState extends State<BOFSpinPageFYQA> {
  final List<String> _images = [
    "assets/images/slot_10.png",
    "assets/images/slot_a.png",
    "assets/images/slot_book.png",
    "assets/images/slot_j.png",
    "assets/images/slot_k.png",
    "assets/images/slot_q.png",
  ];
  final List<int> _indexs1 = [];
  final List<int> _indexs2 = [];
  final List<int> _indexs3 = [];
  bool _canTap = true;

  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();
  final ScrollController _controller3 = ScrollController();

  final List<int> _coins = [50, 100, 150, 200];

  @override
  void initState() {
    for (int i = 0; i < 1000; i++) {
      _indexs1.add(Random().nextInt(5));
      _indexs2.add(Random().nextInt(5));
      _indexs3.add(Random().nextInt(5));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Column(
        children: [
          const BOFCustomAppBarNBZ(),
          SizedBox(height: 10.r),
          Expanded(
            child: Row(
              children: [
                for (int j = 0; j < 3; j++)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.r),
                      child: ListView(
                        shrinkWrap: true,
                        controller: j == 0
                            ? _controller1
                            : j == 1
                                ? _controller2
                                : _controller3,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          for (int i = 0; i < 1000; i++)
                            Center(
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff110905),
                                      Color(0xff4B1F0D),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: Center(
                                    child: Image.asset(
                                      _images[j == 0
                                          ? _indexs1[i]
                                          : j == 1
                                              ? _indexs2[i]
                                              : _indexs3[i]],
                                      height: 130.r,
                                      width: 130.r,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10.r),
          GestureDetector(
            onTap: _canTap
                ? () async {
                    setState(() {
                      _canTap = false;
                    });
                    _controller1.animateTo(
                      4600.r,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                    );
                    _controller2.animateTo(
                      4600.r,
                      duration: const Duration(seconds: 3),
                      curve: Curves.fastOutSlowIn,
                    );
                    _controller3.animateTo(
                      4600.r,
                      duration: const Duration(seconds: 4),
                      curve: Curves.fastOutSlowIn,
                    );
                    int posIndx = 4600.r ~/ 150.r;
                    posIndx = posIndx + 2;

                    Future.delayed(
                      const Duration(seconds: 5),
                      () {
                        if (_indexs1[posIndx] == _indexs2[posIndx] &&
                            _indexs2[posIndx] == _indexs3[posIndx]) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return BOFAnimDialogGTQ(
                                content: BOFWinAlertNIU(
                                  coin: _coins[Random().nextInt(4)],
                                ),
                              );
                            },
                          );
                        } else {
                          showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (context) {
                              return BOFAnimDialogGTQ(
                                content: BOFLoseAlertTQA(
                                  coin: _coins[Random().nextInt(4)],
                                ),
                              );
                            },
                          );
                        }
                        int day =
                            context.read<SharedPreferences>().getInt("day") ??
                                0;
                        context.read<SharedPreferences>().setInt(
                              "day",
                              day + 1,
                            );
                      },
                    );
                  }
                : () {},
            child: Image.asset(
              Images.spinButton,
              height: 122.r,
            ),
          ),
        ],
      ),
    );
  }
}
