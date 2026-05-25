import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle allFeaturedTextStyle = TextStyle(
    fontSize: 10.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w400,
    color: const Color(0xff21003D),
    height: 1.6,
  );

  static TextStyle titleTextStyle = TextStyle(
    fontSize: 18.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    height: 1.22,
  );
  static TextStyle navBarTextStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: AppFonts.navBarTextFont,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    height: 1.33,
  );
  static TextStyle productItemTitleStyle = TextStyle(
    fontSize: 16.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    height: 1.25,
  );
  static TextStyle productItemDescStyle = TextStyle(
    fontSize: 10.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    height: 1.6,
  );
  static TextStyle productItemPriceStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    height: 1.33,
  );
  static TextStyle productItemRatingStyle = TextStyle(
    fontSize: 10.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA4A9B3),
    height: 1.33,
  );

  static TextStyle authTextSTyle = TextStyle(
    fontSize: 23.sp,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.33,
  );
  static TextStyle titletextPageView = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.primaryFont,
    color: Colors.white,
    height: 1.1,
  );
    static TextStyle subTitletextPageView = TextStyle(
    fontFamily: AppFonts.primaryFont,

    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.3,
  );
}
