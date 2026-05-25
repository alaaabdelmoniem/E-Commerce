import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedVeiw extends StatelessWidget {
  const GetStartedVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        right: false,
        left: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              kGetStartedImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    'You want\nAuthentic, here\nyou go!',
                    style: TextStyle(
                      fontSize: 34.sp,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Find it here, buy it now!',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffF2F2F2),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 106.w,
                        vertical: 13.5.h,
                      ),
                      backgroundColor: const Color(0xffF83758),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () =>
                        Navigation.push(context, ScreensId.loginView),
                    child: Text('Login', style: AppTextStyles.authTextSTyle),
                  ),
                  SizedBox(height: 15.h),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 90.w,
                        vertical: 13.5.h,
                      ),
                      backgroundColor: const Color(0xffF83758),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () =>
                        Navigation.push(context, ScreensId.signupView),
                    child: Text('Register', style: AppTextStyles.authTextSTyle),
                  ),
                  SizedBox(height: 35.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
