import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_gradient_stroke_text_dya.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFAppButtonGYA extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double horizontal;
  final double textSize;
  const BOFAppButtonGYA({
    super.key,
    required this.title,
    required this.onTap,
    this.horizontal = 26,
    this.textSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffF7C504),
            width: 3.r,
          ),
          borderRadius: BorderRadius.circular(13),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff055DBB),
              Color(0xff022A55),
            ],
          ),
        ),
        child: SizedBox(
          width: 250.r,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.r,
              horizontal: horizontal.r,
            ),
            child: BOFGradientStrokeTextTRQ(
              title: title,
              textSize: textSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
