import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFCustomLineVYQ extends StatelessWidget {
  final Color color;
  final bool boffirstIsTopBVI;
  final bool bofsecondIsRightTRQ;
  final bool bofisFourthDAQ;
  const BOFCustomLineVYQ(
      {super.key,
      required this.color,
      required this.boffirstIsTopBVI,
      required this.bofsecondIsRightTRQ,
      required this.bofisFourthDAQ});

  @override
  Widget build(BuildContext context) {
    double met = bofisFourthDAQ ? 30.r : 10.r;
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: boffirstIsTopBVI
                ? EdgeInsets.only(top: met)
                : EdgeInsets.only(bottom: met),
            child: Container(
              color: color,
              width: 20.r,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: bofsecondIsRightTRQ
                ? EdgeInsets.only(right: met)
                : EdgeInsets.only(left: met),
            child: Container(
              color: color,
              width: double.infinity,
              height: 20.r,
            ),
          ),
        ),
      ],
    );
  }
}
