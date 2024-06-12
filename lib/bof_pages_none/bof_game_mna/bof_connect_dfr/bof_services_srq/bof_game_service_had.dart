import 'package:flutter/material.dart';

class BOFGameServiceTDQ {
  Color bofgetColorFromTypeFTQ(int type) {
    Color color = Colors.white;
    switch (type) {
      case 0:
        color = const Color(0xffC1FF72);
      case 1:
        color = const Color(0xff72DDFF);
      case 2:
        color = const Color(0xffFF3939);
      case 3:
        color = const Color(0xffFCFF72);
      case 4:
        color = const Color(0xff00FF85);
      case 5:
        color = const Color(0xffFF0099);
      case 6:
        color = const Color(0xffFFB800);
      case 7:
        color = const Color(0xffC172FF);
      case 8:
        color = const Color(0xff00FFF0);
      case 9:
        color = const Color(0xff2063C7);
      case 10:
        color = const Color.fromARGB(255, 199, 32, 110);
      case 11:
        color = const Color.fromARGB(255, 77, 199, 32);
      default:
        color = Colors.white;
    }
    return color;
  }
}
