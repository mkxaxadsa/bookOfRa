// ignore_for_file: library_private_types_in_public_api

import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_anim_dialog_nga.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_book_alert.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_pages_none/bof_game_mna/bof_escape_ewq/bof_widgets_yiq/bof_gridbutton_rta.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameEscapePage extends StatefulWidget {
  final int level;
  const GameEscapePage({
    super.key,
    required this.level,
  });

  @override
  _GameEscapePageState createState() => _GameEscapePageState();
}

class _GameEscapePageState extends State<GameEscapePage> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int secondsPassed = 0;

  bool isActive = false;

  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BOFCustomAppBarNBZ(),
          DecoratedBox(
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
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return numbers[index] != 0
                      ? BOFGridButtonHIA("${numbers[index]}", () {
                          clickGrid(index);
                        })
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.r,
            ),
            child: GestureDetector(
              onTap: () {
                reset();
              },
              child: Image.asset(
                Images.resetButton,
                height: 80.r,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
    } else {}
    checkWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed += 1;
      });
    }
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      BOFAppConvertHIYQ.fosgetCoinBUYQ(widget.level * 10 + 10, context);
      showDialog(
        context: context,
        builder: (context) {
          return BOFAnimDialogGTQ(
            content: BOFBookAlertNGA(
              coin: widget.level * 10 + 10,
            ),
          );
        },
      );
    }
  }
}
