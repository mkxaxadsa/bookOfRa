import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_convert_jq.dart';
import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_app_nav_vqd.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_app_page_erq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_custom_app_bar_dfa.dart';
import 'package:book_of_ra/bof_pages_none/bof_logic_cya/bof_select_level_page_loq.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BOFSelectGamePagehUQA extends StatefulWidget {
  const BOFSelectGamePagehUQA({super.key});

  @override
  State<BOFSelectGamePagehUQA> createState() => _BOFSelectGamePagehUQAState();
}

class _BOFSelectGamePagehUQAState extends State<BOFSelectGamePagehUQA> {
  late SharedPreferences _sharedPreferences;
  int coin = 0;

  @override
  void initState() {
    _sharedPreferences = context.read<SharedPreferences>();

    load();
    super.initState();
  }

  load() {
    coin = _sharedPreferences.getInt("coin") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BOFAppPageGTQ(
      backgroundImage: BOFAppConvertHIYQ.fosgetBackIndexOPA(context: context),
      content: Column(
        children: [
          BOFCustomAppBarNBZ(
            coin: coin,
          ),
          Expanded(
              child: ListView(
            children: [
              SizedBox(height: 100.r),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.r,
                ),
                children: [
                  GestureDetector(
                    onTap: () async {
                      await FOSAppNavVQE.fospushPageBGA(
                        const BOFSelectLevelPagePUQ(
                          bOFGameConnectPageVYQ: true,
                        ),
                        context,
                      );
                      load();
                    },
                    child: Image.asset(
                      Images.gameConnect,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FOSAppNavVQE.fospushPageBGA(
                        const BOFSelectLevelPagePUQ(
                          bOFGameBlocksPageNBA: true,
                        ),
                        context,
                      );
                      load();
                    },
                    child: Image.asset(
                      Images.gameBlocs,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FOSAppNavVQE.fospushPageBGA(
                        const BOFSelectLevelPagePUQ(
                          gameBallsPage: true,
                        ),
                        context,
                      );
                      load();
                    },
                    child: Image.asset(
                      Images.gameBoll,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FOSAppNavVQE.fospushPageBGA(
                        const BOFSelectLevelPagePUQ(
                          gameEscapetPage: true,
                        ),
                        context,
                      );
                      load();
                    },
                    child: Image.asset(
                      Images.gameEscape,
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
