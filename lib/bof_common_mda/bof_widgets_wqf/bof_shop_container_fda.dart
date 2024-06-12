import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_app_theme_tytq.dart';
import 'package:book_of_ra/bof_common_mda/bof_widgets_wqf/bof_coin_container_ita.dart';
import 'package:book_of_ra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BOFShopContainerNBV extends StatelessWidget {
  final String image;
  final String texts;
  final VoidCallback onTap;
  const BOFShopContainerNBV({
    super.key,
    required this.image,
    required this.texts,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40.r),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                    width: 156.r,
                    height: 156.r,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: -20.r,
                child: const BOFCoinContainerGYQ(coin: 150),
              ),
              Positioned(
                top: 0.r,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xffF38019),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff371713),
                        Color(0xffBF4C28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(9, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20.r,
                      left: 20.r,
                    ),
                    child: Text(
                      texts,
                      style: TextStyle(
                        color: const Color(0xffFFED9A),
                        fontSize: 20.sp,
                        fontFamily: BOFAppFontsTTQ.inriaSans,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.r),
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              Images.buyButton,
              width: 100.r,
            ),
          ),
        ],
      ),
    );
  }
}
