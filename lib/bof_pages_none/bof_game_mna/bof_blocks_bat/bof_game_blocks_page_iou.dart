import 'dart:async';

import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_anim_dialog_nga.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_gradient_stroke_text_dya.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_lose_alert_ewq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_win_alert_ytw.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFGameBlocksPageNBA extends StatefulWidget {
  final int level;
  const BOFGameBlocksPageNBA({
    super.key,
    required this.level,
  });

  @override
  State<BOFGameBlocksPageNBA> createState() => _BOFGameBlocksPageNBAState();
}

class _BOFGameBlocksPageNBAState extends State<BOFGameBlocksPageNBA> {
  final List<int> _bofindexesADA = [12 + 3];
  int _valuesLen = 9;
  List<int> _selectedPositions = [];
  int _selectIndex = -1;
  int time = 0;
  late Timer _timer;
  bool _showBorder = true;
  bool? _selectBase;

  @override
  void initState() {
    time = widget.level * 10 + 20;

    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _showBorder = false;
        });
      },
    );
    List<int> allIndexes = [];
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);
    allIndexes.addAll(_bofindexesADA);

    _valuesLen = allIndexes[widget.level];
    if (widget.level == 0) {
      _valuesLen = 12;
    }
    for (int i = 0; i < _valuesLen; i++) {
      _selectedPositions.add(-1);
    }

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          time--;
          if (time == 0) {
            _timer.cancel();
            showDialog(
              useSafeArea: false,
              context: context,
              builder: (context) {
                return const BOFAnimDialogGTQ(
                  content: BOFLoseAlertTQA(
                    isFromGame: true,
                    coin: 0,
                  ),
                );
              },
            );
          }
        });
      },
    );
    super.initState();
  }

  void reset() {
    _selectIndex = -1;
    time = widget.level * 10 + 10;
    _selectedPositions = [];
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int getInt() {
    if (widget.level == 0) {
      return 12;
    } else {
      return _valuesLen - 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BOFCustomAppBarNBZ(),
          Column(
            children: [
              BOFGradientStrokeTextTRQ(
                title: BOFAppConvertHIYQ.fosconvertTimerFormatBGT(
                  Duration(seconds: time),
                ),
                textSize: 20,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 10.r),
              SizedBox(
                height: 50.r,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20.r),
                    for (int i = 0; i < _valuesLen; i++)
                      !_selectedPositions.contains(i)
                          ? Padding(
                              padding: EdgeInsets.only(right: 10.r),
                              child: GestureDetector(
                                onTap: () {
                                  if (_selectIndex != -1) {
                                    _selectIndex = -1;
                                  } else {
                                    _selectIndex = i;
                                  }
                                  if (i >= 9) {
                                    _selectBase = false;
                                  } else {
                                    _selectBase = true;
                                  }
                                  if (widget.level == 0) {
                                    _selectBase = true;
                                  }
                                  setState(() {});
                                },
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns:
                                        (i >= 9) && widget.level != 0 ? 45 : 0,
                                    child: Image.asset(
                                      _selectIndex == i
                                          ? Images.selectBloc
                                          : Images.twoBlock,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                  ],
                ),
              ),
              SizedBox(height: 10.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.r),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xff7B3501),
                    ),
                    gradient: const RadialGradient(
                      colors: [
                        Color(0xffFF6300),
                        Color(0xff8E4700),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Column(
                      children: [
                        GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.8,
                            crossAxisSpacing: 4.r,
                          ),
                          children: [
                            for (int i = 0; i < getInt(); i++)
                              _selectedPositions.contains(i)
                                  ? Image.asset(
                                      Images.twoBlock,
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        if (_selectIndex != -1 &&
                                            _selectBase != null &&
                                            _selectBase!) {
                                          _selectedPositions[i] = i;
                                          _selectIndex = -1;
                                          _selectBase = null;

                                          setState(() {});
                                        }
                                        if (_selectBase != null &&
                                            !_selectBase!) {
                                          setState(() {
                                            _selectIndex = -1;
                                            _selectBase = null;
                                          });
                                        }

                                        if (_selectedPositions
                                            .where((element) => element == -1)
                                            .isEmpty) {
                                          _timer.cancel();
                                          Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                              BOFAppConvertHIYQ.fosgetCoinBUYQ(
                                                  widget.level * 10 + 10,
                                                  context);
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return BOFAnimDialogGTQ(
                                                    content: BOFWinAlertNIU(
                                                      fromGame: true,
                                                      coin: widget.level * 10 +
                                                          10,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: _showBorder
                                                ? Colors.white
                                                : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                          ],
                        ),
                        if (widget.level != 0)
                          GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 4.r,
                            ),
                            children: [
                              for (int i = _valuesLen - 6; i < _valuesLen; i++)
                                _selectedPositions.contains(i)
                                    ? RotatedBox(
                                        quarterTurns: 45,
                                        child: Image.asset(
                                          Images.twoBlock,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          if (_selectIndex != -1 &&
                                              _selectBase != null &&
                                              !_selectBase!) {
                                            _selectedPositions[i] = i;
                                            _selectIndex = -1;
                                            _selectBase = null;

                                            setState(() {});
                                          }
                                          if (_selectBase != null &&
                                              _selectBase!) {
                                            setState(() {
                                              _selectIndex = -1;
                                              _selectBase = null;
                                            });
                                          }

                                          if (_selectedPositions
                                              .where((element) => element == -1)
                                              .isEmpty) {
                                            _timer.cancel();
                                            Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () {
                                                BOFAppConvertHIYQ
                                                    .fosgetCoinBUYQ(
                                                        widget.level * 10 + 10,
                                                        context);
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return BOFAnimDialogGTQ(
                                                      content: BOFWinAlertNIU(
                                                        fromGame: true,
                                                        coin:
                                                            widget.level * 10 +
                                                                10,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: _showBorder
                                                  ? Colors.white
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: reset,
            child: Image.asset(
              Images.resetButton,
              height: 100.r,
            ),
          ),
        ],
      ),
    );
  }
}
