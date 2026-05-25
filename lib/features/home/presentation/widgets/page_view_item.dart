import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/shopping.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('50-40% OFF', style: AppTextStyles.titletextPageView),
              SizedBox(height: 8.h),
              Text(
                'Now in (product) \nAllcolours',
                style: AppTextStyles.subTitletextPageView,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 100,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8.r),
                    side: const BorderSide(color: Colors.white),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Shop Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.primaryFont,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
