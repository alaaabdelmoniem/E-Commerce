import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/widgets/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboardingbody extends StatelessWidget {
  const CustomOnboardingbody({
    super.key,
    this.isSkip = true,
    required this.title,
    required this.desc,
    required this.image,
    this.width,
    this.hight, this.onTap,
  });
  final bool isSkip;
  final String title;
  final String desc;
  final String image;
  final double? width;
  final double? hight;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSkip
            ? Align(
                alignment: Alignment.topRight,
                child: GestureDetector(onTap: onTap, child: Text('Skip', style: AppTextStyles.titleTextStyle)),
              )
            : const SizedBox.shrink(),
        SizedBox(height: 90.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgImage(urlImage: image, hight: hight, width: hight),
            SizedBox(height: 15.h),
            Text(
              title,
              style: TextStyle(
                fontFamily: AppFonts.primaryFont,
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              desc,
              style: TextStyle(
                fontFamily: AppFonts.primaryFont,
                color: const Color(0xffA8A8A9),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
