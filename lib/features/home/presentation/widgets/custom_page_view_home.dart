import 'package:e_commerce/features/home/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageViewHome extends StatefulWidget {
  const CustomPageViewHome({super.key});

  @override
  State<CustomPageViewHome> createState() => _CustomPageViewHomeState();
}

class _CustomPageViewHomeState extends State<CustomPageViewHome> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 202.h,
          child: PageView.builder(
            padEnds: false,
            controller: controller,
            itemBuilder: (context, index) =>const PageViewItem(),
            itemCount: 3,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),

        // dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (int index) {
            return AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: 9,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? const Color(0XFFFFA3B3)
                    : const Color(0XFFDEDBDB),
                borderRadius: BorderRadius.circular(5.r),
              ),
            );
          }),
        ),
      ],
    );
  }
}
