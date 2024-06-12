import 'dart:async';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_win_alert_ytw.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFBookAlertNGA extends StatefulWidget {
  final int coin;
  const BOFBookAlertNGA({
    super.key,
    required this.coin,
  });

  @override
  State<BOFBookAlertNGA> createState() => _BOFBookAlertNGAState();
}

class _BOFBookAlertNGAState extends State<BOFBookAlertNGA> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return BOFWinAlertNIU(
              fromGame: true,
              coin: widget.coin * 10 + 10,
            );
          },
        );
      },
    );
    super.initState();
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
          Images.book,
          width: 320.r,
        ),
      ],
    );
  }
}
