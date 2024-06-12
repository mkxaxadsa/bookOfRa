import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_gradient_text_erq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFGradientStrokeTextTRQ extends StatelessWidget {
  final String title;
  final double textSize;
  final FontWeight fontWeight;
  const BOFGradientStrokeTextTRQ({
    super.key,
    required this.title,
    required this.textSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: textSize.sp,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2.r
              ..color = Colors.black,
          ),
        ),
        BOFGradientTextFTQ(
          title,
          style: TextStyle(
            fontSize: textSize.sp,
            fontWeight: fontWeight,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.4, 1],
            colors: [
              Color(0xffF7C504),
              Color(0xffFFECA2),
              Color(0xffED9403),
            ],
          ),
        ),
      ],
    );
  }
}
