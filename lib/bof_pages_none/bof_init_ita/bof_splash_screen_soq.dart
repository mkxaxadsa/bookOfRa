import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_nav_vqd.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_home_page_nka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFSplashScreenDIA extends StatefulWidget {
  const BOFSplashScreenDIA({super.key});

  @override
  State<BOFSplashScreenDIA> createState() => _BOFSplashScreenDIAState();
}

class _BOFSplashScreenDIAState extends State<BOFSplashScreenDIA> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        FOSAppNavVQE.fospushReplacementPageLKJA(
            const BOFHomePageLOA(), context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: "assets/images/iPhone big@3x.png",
      content: Center(
        child: SizedBox(
          height: 30.r,
          child: const CircularProgressIndicator(
            color: Color(0xffFEF445),
          ),
        ),
      ),
    );
  }
}
