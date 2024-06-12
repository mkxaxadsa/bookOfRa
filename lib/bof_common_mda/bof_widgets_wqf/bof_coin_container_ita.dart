import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_app_theme_tytq.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFCoinContainerGYQ extends StatelessWidget {
  final int coin;
  const BOFCoinContainerGYQ({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xffF38019),
            ),
            gradient: const LinearGradient(
              colors: [
                Color(0xff371713),
                Color(0xffBF4C28),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(9, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: 18.r,
              left: 30.r,
            ),
            child: Text(
              coin.toString(),
              style: TextStyle(
                color: const Color(0xffFFED9A),
                fontSize: 30.sp,
                fontFamily: BOFAppFontsTTQ.inriaSans,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Positioned(
          left: -20.r,
          child: Image.asset(
            Images.coin,
            height: 43.r,
          ),
        ),
      ],
    );
  }
}
