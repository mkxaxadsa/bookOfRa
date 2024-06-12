import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFAppConvertHIYQ {
  static void fosgetCoinBUYQ(int addCoin, BuildContext context) {
    int oldCoin = context.read<SharedPreferences>().getInt("coin") ?? 0;
    oldCoin += addCoin;
    context.read<SharedPreferences>().setInt("coin", oldCoin);
  }

  static String fosgetBackIndexOPA({
    bool isHome = false,
    required BuildContext context,
  }) {
    int type = context.read<SharedPreferences>().getInt("useBack") ?? 0;
    return "assets/images/back_${isHome ? "home_" : ""}$type.png";
  }

  static String fosconvertTimerFormatBGT(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
