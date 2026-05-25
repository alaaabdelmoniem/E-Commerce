import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:flutter/material.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      String? token =
          CacheHelper.getValue(key: CacheKeys.accessToken) as String?;
      if (token != null) {
        Navigation.pushReplacement(context, ScreensId.appView);
      } else if (CacheHelper.getValue(key: CacheKeys.firstOpen) == true) {
        Navigation.pushReplacement(context, ScreensId.loginView);
      } else {
        Navigation.pushReplacement(context, ScreensId.onBoardingView);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(kSplashImage),
              const Text(
                'Stylish',
                style: TextStyle(
                  color: Color(0xffF83758),
                  fontFamily: AppFonts.logoTextFont,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  height: .55,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
