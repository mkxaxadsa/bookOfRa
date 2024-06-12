import 'dart:async';
import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_anim_dialog_nga.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_win_alert_ytw.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_connect_dfr/bof_services_srq/bof_custom_line_liu.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_connect_dfr/bof_services_srq/bof_game_service_had.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFGameConnectPageVYQ extends StatefulWidget {
  final int level;
  const BOFGameConnectPageVYQ({
    super.key,
    required this.level,
  });

  @override
  State<BOFGameConnectPageVYQ> createState() => _BOFGameConnectPageVYQState();
}

class _BOFGameConnectPageVYQState extends State<BOFGameConnectPageVYQ> {
  late SharedPreferences sharedPreferences;
  BOFGameServiceTDQ bOFGameServiceTDQ = BOFGameServiceTDQ();
  int steps = 0;
  int lines = 0;
  int maxLines = 2;

  List<int> bofFIRSTVQUT = [];
  List<int> styles = [];
  List<int> bofSecondTRQ = [];

  int currectLine = -1;
  int itemSelect = -1;

  Color bofcurrentColorTUA = Colors.white;

  List<List<int>> positions = [];
  late int size;

  List<int> connected = [];

  List<int> bofcompleteIndexsVYQ = [];

  int bofstartSelectYIQ = -1;

  List<List<int>> bofendPointsTTQ = [];
  List<Color> bofendColorsRQP = [];

  List<List<int>> boffinalResultGUQ = [];

  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();

    List<String> haveSetsString = [
      "4",
      "5",
      "0",
      "1",
      "2",
      "3",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
    ];
    for (var element in haveSetsString) {
      styles.add(int.parse(element));
    }
    styles.shuffle();
    size = getSize();
    maxLines = getLevelsbofFIRSTVQUTs()[widget.level].length;
    bofFIRSTVQUT = getLevelsbofFIRSTVQUTs()[widget.level];
    bofSecondTRQ = getLevelsbofSecondTRQ()[widget.level];

    int start = 0;

    for (int i = 0; i < size; i++) {
      List<int> current = [];
      for (int j = 0; j < size; j++) {
        current.add(i + start);
        start++;
      }
      start--;
      positions.add(current);
    }

    super.initState();
  }

  int getSize() {
    return 10;
  }

  void onItemTap(int index) async {
    if ((bofFIRSTVQUT.contains(index))) {
      if (itemSelect != -1) {
        connected.clear();
        bofstartSelectYIQ = -1;
      }
      itemSelect = index;
      bofstartSelectYIQ = index;
      currectLine = bofFIRSTVQUT.indexOf(index);
      if (bofFIRSTVQUT.contains(index)) {
        bofcurrentColorTUA = bOFGameServiceTDQ
            .bofgetColorFromTypeFTQ(styles[bofFIRSTVQUT.indexOf(index)]);
      } else {
        bofcurrentColorTUA = bOFGameServiceTDQ
            .bofgetColorFromTypeFTQ(styles[bofSecondTRQ.indexOf(index)]);
      }
    }

    setState(() {});
    if ((index != itemSelect || !connected.contains(index))) {
      int selectLine =
          positions.indexWhere((element) => element.contains(index));
      int currentLine =
          positions.indexWhere((element) => element.contains(itemSelect));

      if (selectLine == currentLine) {
        // на одной строке - линию можно рисовать
        if (index < itemSelect) {
          //новая ночка находится слева
          List<int> newConnect = [];

          for (int i = index; i < itemSelect; i++) {
            newConnect.add(i);
          }

          makeReverse(newConnect);
        } else {
          //новая точка находится справа
          for (int i = itemSelect; i < index; i++) {
            connected.add(i + 1);
          }
        }

        winCheck(index);
      } else {
        //вертикальная позиция выбранной точки
        int selectLine =
            positions.indexWhere((element) => element.contains(index));
        int verticalPosIndex = positions[selectLine].indexOf(index);
        //вертикальная позиция старой точки
        int selectLineOld =
            positions.indexWhere((element) => element.contains(itemSelect));
        int verticalPosIndexOld = positions[selectLineOld].indexOf(itemSelect);
        if (verticalPosIndex == verticalPosIndexOld) {
          if (index < itemSelect) {
            List<int> newConnect = [];

            for (int i = index; i < itemSelect; i = i + size) {
              newConnect.add(i);
            }
            makeReverse(newConnect);
          } else {
            List<int> newConnect = [];
            for (int i = index; i > itemSelect; i = i - size) {
              newConnect.add(i);
            }
            makeReverse(newConnect);
          }
          winCheck(index);
        }
      }
    }
    setState(() {});
  }

  void makeReverse(List<int> newConnect) {
    var connectedRev = newConnect.reversed;
    newConnect = List.from(connectedRev);
    connected.addAll(newConnect);
  }

  void winCheck(int newSelectIndex) {
    bool isWrong = false;
    for (var element in connected) {
      if (boffinalResultGUQ
              .where((elementFinal) => elementFinal.contains(element))
              .firstOrNull !=
          null) {
        isWrong = true;
      }
    }
    if (isWrong) {
      connected.clear();
      itemSelect = bofstartSelectYIQ;
      connected.add(itemSelect);
      setState(() {});
    } else {
      if (bofSecondTRQ.contains(newSelectIndex)) {
        if (newSelectIndex == bofSecondTRQ[currectLine]) {
          lines++;
          itemSelect = -1;
          currectLine = -1;
          bofendColorsRQP.add(bofcurrentColorTUA);
          bofendPointsTTQ.add([bofstartSelectYIQ, newSelectIndex]);
          bofcompleteIndexsVYQ.add(bofstartSelectYIQ);
          bofcompleteIndexsVYQ.addAll(connected);
          List<int> obofcompleteIndexsVYQ = [];
          obofcompleteIndexsVYQ.add(bofstartSelectYIQ);
          obofcompleteIndexsVYQ.addAll(connected);
          boffinalResultGUQ.add(obofcompleteIndexsVYQ);
          connected.clear();

          if (lines == maxLines) {
            Future.delayed(const Duration(seconds: 1), () {
              onEndGame();
            });
          }
        } else {
          connected.clear();
          itemSelect = -1;
          bofstartSelectYIQ = -1;
        }
      } else {
        itemSelect = newSelectIndex;
      }
    }
  }

  void cleanAll() {
    connected.clear();
    itemSelect = -1;
    bofstartSelectYIQ = -1;
    boffinalResultGUQ.clear();
    bofendColorsRQP.clear();
    bofendPointsTTQ.clear();
    bofcompleteIndexsVYQ.clear();
    lines = 0;
    setState(() {});
  }

  void onEndGame() {
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

  int nextValue(int i) {
    int result = 0;
    int currentValIndex = boffinalResultGUQ
        .where((element) => element.contains(i))
        .first
        .indexOf(i);
    var strip =
        boffinalResultGUQ.where((element) => element.contains(i)).firstOrNull;
    if (strip == null) {
    } else {
      if (strip.length >= currentValIndex + 2) {
        result = strip[currentValIndex + 1];
      }
    }
    return result;
  }

  Color getColor(int i) {
    int currentValIndex = boffinalResultGUQ.indexOf(
        boffinalResultGUQ.where((element) => element.contains(i)).first);

    return bofendColorsRQP[currentValIndex];
  }

  int prevValue(int i) {
    int result = -1;
    int currentValIndex = boffinalResultGUQ
        .where((element) => element.contains(i))
        .first
        .indexOf(i);
    var pos =
        boffinalResultGUQ.where((element) => element.contains(i)).firstOrNull;

    if (pos == null) {
    } else {
      if (currentValIndex != 0) {
        result = pos[currentValIndex - 1];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BOFCustomAppBarNBZ(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const RadialGradient(
                  colors: [
                    Color(0xffB03523),
                    Color(0xff4A160F),
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    GridView(
                      padding: EdgeInsets.all(8.r),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size,
                      ),
                      children: [
                        for (int i = 0; i < size * size; i++)
                          GestureDetector(
                              onTap: bofcompleteIndexsVYQ.contains(i)
                                  ? () {}
                                  : () => onItemTap(i),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: i == itemSelect
                                        ? bofcurrentColorTUA
                                        : bofendPointsTTQ
                                                    .where((element) =>
                                                        element.contains(i))
                                                    .firstOrNull !=
                                                null
                                            ? bofendColorsRQP[bofendPointsTTQ
                                                .indexOf(bofendPointsTTQ
                                                    .where((element) =>
                                                        element.contains(i))
                                                    .first)]
                                            : const Color(0xffFFCEAB)
                                                .withOpacity(0.5),
                                    width: i == itemSelect ||
                                            bofendPointsTTQ
                                                    .where((element) =>
                                                        element.contains(i))
                                                    .firstOrNull !=
                                                null
                                        ? 4
                                        : 1,
                                  ),
                                ),
                                child: bofFIRSTVQUT.contains(i)
                                    ? Center(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.r),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: BOFGameServiceTDQ()
                                                    .bofgetColorFromTypeFTQ(
                                                        styles[bofFIRSTVQUT
                                                            .indexOf(i)]),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : bofSecondTRQ.contains(i)
                                        ? Padding(
                                            padding: EdgeInsets.all(4.r),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: BOFGameServiceTDQ()
                                                    .bofgetColorFromTypeFTQ(
                                                        styles[bofSecondTRQ
                                                            .indexOf(i)]),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                            ),
                                          )
                                        : connected.contains(i)
                                            ? Center(
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : boffinalResultGUQ
                                                        .where((element) =>
                                                            element.contains(i))
                                                        .firstOrNull !=
                                                    null
                                                ? (prevValue(i) + 1 == i) &&
                                                            (i + 1 ==
                                                                nextValue(i)) ||
                                                        (prevValue(i) - 1 == i) &&
                                                            (i - 1 ==
                                                                nextValue(i))
                                                    ? Center(
                                                        child: Container(
                                                          color: getColor(i),
                                                          height: 20,
                                                        ),
                                                      )
                                                    : (((prevValue(i) + size == i) &&
                                                                (i + size ==
                                                                    nextValue(
                                                                        i))) |
                                                            ((prevValue(i) - size ==
                                                                    i) &&
                                                                (i - size ==
                                                                    nextValue(
                                                                        i))))
                                                        ? Center(
                                                            child: Container(
                                                              color:
                                                                  getColor(i),
                                                              width: 20,
                                                            ),
                                                          )
                                                        : ((prevValue(i) + 1 == i) &&
                                                                (i < nextValue(i)))
                                                            ? BOFCustomLineVYQ(
                                                                bofisFourthDAQ:
                                                                    size == 4,
                                                                bofsecondIsRightTRQ:
                                                                    true,
                                                                boffirstIsTopBVI:
                                                                    true,
                                                                color:
                                                                    getColor(i),
                                                              )
                                                            : ((prevValue(i) + 1 == i) && (i > nextValue(i)))
                                                                ? BOFCustomLineVYQ(
                                                                    bofisFourthDAQ:
                                                                        size ==
                                                                            4,
                                                                    bofsecondIsRightTRQ:
                                                                        true,
                                                                    boffirstIsTopBVI:
                                                                        false,
                                                                    color:
                                                                        getColor(
                                                                            i),
                                                                  )
                                                                : ((i + 1 == nextValue(i)) && (prevValue(i) > i))
                                                                    ? BOFCustomLineVYQ(
                                                                        bofisFourthDAQ:
                                                                            size ==
                                                                                4,
                                                                        bofsecondIsRightTRQ:
                                                                            false,
                                                                        boffirstIsTopBVI:
                                                                            true,
                                                                        color:
                                                                            getColor(i),
                                                                      )
                                                                    : ((prevValue(i) + size == i) && (nextValue(i) < i))
                                                                        ? BOFCustomLineVYQ(
                                                                            bofisFourthDAQ:
                                                                                size == 4,
                                                                            bofsecondIsRightTRQ:
                                                                                true,
                                                                            boffirstIsTopBVI:
                                                                                false,
                                                                            color:
                                                                                getColor(i),
                                                                          )
                                                                        : ((prevValue(i) + size == i) && (nextValue(i) > i))
                                                                            ? BOFCustomLineVYQ(
                                                                                bofisFourthDAQ: size == 4,
                                                                                bofsecondIsRightTRQ: false,
                                                                                boffirstIsTopBVI: false,
                                                                                color: getColor(i),
                                                                              )
                                                                            : ((i + 1 == prevValue(i)) && (i - size == nextValue(i)))
                                                                                ? BOFCustomLineVYQ(
                                                                                    bofisFourthDAQ: size == 4,
                                                                                    bofsecondIsRightTRQ: true,
                                                                                    boffirstIsTopBVI: false,
                                                                                    color: getColor(i),
                                                                                  )
                                                                                : ((prevValue(i) - 1 == i) && (nextValue(i) - size == i))
                                                                                    ? BOFCustomLineVYQ(
                                                                                        bofisFourthDAQ: size == 4,
                                                                                        bofsecondIsRightTRQ: false,
                                                                                        boffirstIsTopBVI: true,
                                                                                        color: getColor(i),
                                                                                      )
                                                                                    : ((prevValue(i) - size == i) && (i - 1 == nextValue(i)))
                                                                                        ? BOFCustomLineVYQ(
                                                                                            bofisFourthDAQ: size == 4,
                                                                                            bofsecondIsRightTRQ: true,
                                                                                            boffirstIsTopBVI: true,
                                                                                            color: getColor(i),
                                                                                          )
                                                                                        : const SizedBox()
                                                : const SizedBox(),
                              )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              cleanAll();
            },
            child: Image.asset(
              Images.resetButton,
              height: 108.r,
            ),
          ),
        ],
      ),
    );
  }
}

List<List<int>> getLevelsbofFIRSTVQUTs() => [
      [0, 21, 12, 13, 7, 17, 27, 87, 26, 31, 64, 71],
      [9, 0, 10, 91, 11, 12, 13, 14, 24, 25, 26, 27],
      [0, 21, 12, 13, 7, 17, 27, 87, 26, 31, 64, 71],
      [0, 21, 12, 13, 7, 17, 27, 87, 26, 31, 64, 71],
      [0, 21, 12, 13, 7, 17, 27, 87, 26, 31, 64, 71],
      [0, 21, 12, 13, 7, 17, 27, 87, 26, 31, 64, 71],
      [0, 21, 12, 13, 7, 17, 27, 87, 26, 31, 64, 71],
    ];
List<List<int>> getLevelsbofSecondTRQ() => [
      [43, 16, 75, 15, 59, 69, 79, 89, 74, 50, 90, 99],
      [99, 8, 90, 98, 81, 82, 83, 18, 28, 75, 76, 77],
      [43, 16, 75, 15, 59, 69, 79, 89, 74, 50, 90, 99],
      [43, 16, 75, 15, 59, 69, 79, 89, 74, 50, 90, 99],
      [43, 16, 75, 15, 59, 69, 79, 89, 74, 50, 90, 99],
      [43, 16, 75, 15, 59, 69, 79, 89, 74, 50, 90, 99],
      [43, 16, 75, 15, 59, 69, 79, 89, 74, 50, 90, 99],
    ];
