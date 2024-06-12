import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_coin_container_ita.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFCustomAppBarNBZ extends StatelessWidget {
  final int? coin;
  const BOFCustomAppBarNBZ({super.key, this.coin});

  @override
  Widget build(BuildContext context) {
    int _coin = context.read<SharedPreferences>().getInt("coin") ?? 0;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              Images.backButton,
              height: 74.r,
            ),
          ),
          BOFCoinContainerGYQ(coin: coin ?? _coin),
        ],
      ),
    );
  }
}
