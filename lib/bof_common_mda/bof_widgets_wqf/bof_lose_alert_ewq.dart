import 'dart:async';

import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_gradient_stroke_text_dya.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_button_yta.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFLoseAlertTQA extends StatefulWidget {
  final int coin;
  final bool isFromGame;
  const BOFLoseAlertTQA({
    super.key,
    required this.coin,
    this.isFromGame = false,
  });

  @override
  State<BOFLoseAlertTQA> createState() => _BOFLoseAlertTQAState();
}

class _BOFLoseAlertTQAState extends State<BOFLoseAlertTQA> {
  late Timer timer;
  int different = 0;

  @override
  void initState() {
    different = const Duration(days: 1).inSeconds;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          different = different - 1;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Images.shine,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Image.asset(
          Images.loseAlert,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 160.r),
            if (!widget.isFromGame)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.coin,
                    height: 40.r,
                  ),
                  BOFGradientStrokeTextTRQ(
                    title: "+${widget.coin}",
                    textSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            if (!widget.isFromGame)
              Column(
                children: [
                  const BOFGradientStrokeTextTRQ(
                    title: "Next attempt:",
                    textSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  BOFGradientStrokeTextTRQ(
                    title: BOFAppConvertHIYQ.fosconvertTimerFormatBGT(
                        Duration(seconds: different)),
                    textSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            SizedBox(
              width: 200.r,
              child: BOFAppButtonGYA(
                horizontal: 10,
                title: "MENU",
                onTap: () {
                  BOFAppConvertHIYQ.fosgetCoinBUYQ(widget.coin, context);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                textSize: 20,
              ),
            ),
            if (widget.isFromGame)
              Padding(
                padding: EdgeInsets.only(top: 10.r),
                child: SizedBox(
                  width: 200.r,
                  child: BOFAppButtonGYA(
                    horizontal: 10,
                    title: "NEXT GAME",
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    textSize: 20,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
