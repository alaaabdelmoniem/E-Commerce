import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/widgets/custom_onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding3View extends StatelessWidget {
  const Onboarding3View({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingbody(
      isSkip: false,
      title: 'Get Your Order',
      desc:
          'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.',
      image: kOnboarding3Image,
      width: 350.w,
      hight: 350.h,
    );
  }
}
