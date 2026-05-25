import 'package:e_commerce/features/onBoarding/presentation/views/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CustomPageView()));
  }
}
