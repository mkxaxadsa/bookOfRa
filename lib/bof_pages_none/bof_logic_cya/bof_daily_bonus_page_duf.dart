import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_nav_vqd.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_gradient_stroke_text_dya.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_button_yta.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_spin_page_jeq.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFDailyBonusPageHIYQ extends StatefulWidget {
  const BOFDailyBonusPageHIYQ({super.key});

  @override
  State<BOFDailyBonusPageHIYQ> createState() => _BOFDailyBonusPageHIYQState();
}

class _BOFDailyBonusPageHIYQState extends State<BOFDailyBonusPageHIYQ> {
  late int _day;
  late SharedPreferences _sharedPreferences;
  @override
  void initState() {
    _sharedPreferences = context.read<SharedPreferences>();
    _day = _sharedPreferences.getInt("day") ?? 0;

    if (_day == 5) {
      _day = 0;
      _sharedPreferences.setInt("day", 0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Center(
        child: Stack(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xffB06B38).withOpacity(0.6),
                borderRadius: BorderRadius.circular(38),
                border: Border.all(
                  color: const Color(0xffF7C504),
                  width: 2.r,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BOFGradientStrokeTextTRQ(
                      title: 'Daily Bonus',
                      textSize: 60,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 11.r),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          buildBonusContainer(
                            i + 1,
                            _day == i,
                          ),
                      ],
                    ),
                    SizedBox(height: 12.r),
                    BOFAppButtonGYA(
                      horizontal: 10,
                      title: "Get a bonus",
                      onTap: () {
                        FOSAppNavVQE.fospushPageBGA(
                            const BOFSpinPageFYQA(), context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBonusContainer(int index, bool isActive) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.r,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffF7C504),
            width: 2.r,
          ),
          color: isActive ? Colors.white : const Color(0xff443D38),
          borderRadius: BorderRadius.circular(17),
          gradient: isActive
              ? const RadialGradient(
                  colors: [
                    Color(0xffFF6C00),
                    Color(0xff874F27),
                  ],
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.r,
            horizontal: 5.r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.coin,
                height: 46.r,
              ),
              BOFGradientStrokeTextTRQ(
                title: "x$index",
                textSize: 44,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
