// ignore_for_file: must_be_immutable, use_key_in_widget_constructors
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_gradient_text_erq.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFGridButtonHIA extends StatelessWidget {
  Function click;
  String text;

  BOFGridButtonHIA(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            Images.grid,
          ),
          BOFGradientTextFTQ(
            text,
            style: TextStyle(
              fontSize: 60.sp,
            ),
            gradient: const LinearGradient(
              colors: [
                Color(0xffDC5B00),
                Color(0xff763100),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        click();
      },
    );
  }
}
