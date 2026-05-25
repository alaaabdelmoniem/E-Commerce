import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/widgets/custom_onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1View extends StatelessWidget {
  const Onboarding1View({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomOnboardingbody(
      title: 'Choose Products',
      desc:
          'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.',
      image: kOnboarding1Image,
      hight: 300.h,
      width: 300.h,
      onTap: () => Navigation.push(context, ScreensId.getStartedView),
    );
  }
}
