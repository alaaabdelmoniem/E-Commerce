import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding1_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding2_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onboarding3_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void previusView() {
    if (currentIndex > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void nextView() {
    if (currentIndex < screens.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  final List<Widget> screens = const [
    Onboarding1View(),
    Onboarding2View(),
    Onboarding3View(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.h),
      child: Column(
        children: [
          SizedBox(
            height: 670.h,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, index) => screens[index],
              itemCount: screens.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
          // dots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentIndex == 0
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),

                      child: TextButton(
                        child: Text(
                          'Prev',
                          style: TextStyle(
                            color: const Color(0XFFC4C4C4),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                        onPressed: () => previusView(),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (int index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      duration: const Duration(milliseconds: 300),

                      height: currentIndex == index ? 8 : 10,
                      width: currentIndex == index ? 40.w : 10.w,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0XFF17223B)
                            : const Color(0XFF17223B).withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: TextButton(
                  child: currentIndex == 2
                      ? Text(
                          'Get Started',
                          style: TextStyle(
                            color: const Color(0XFFF83758),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        )
                      : Text(
                          'Next',
                          style: TextStyle(
                            color: const Color(0XFFF83758),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                  onPressed: () async {
                    if (currentIndex == 2) {
                      await CacheHelper.setValue(
                        key: CacheKeys.firstOpen,
                        value: true,
                      );
                      Navigation.pushReplacement(
                        context,
                        ScreensId.getStartedView,
                      );
                    }
                    nextView();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
