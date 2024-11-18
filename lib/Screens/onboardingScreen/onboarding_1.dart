import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Screens/onboardingScreen/onboarding_2.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/buttons/button.dart';

import '../../config/routes/app_pages.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PngAssetPath.onboard1), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            PngAssetPath.appLogo,
            color: AppColors.whiteColor,
            height: 150,
            width: 150,
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Get.width / 6, vertical: 20),
          child: AppButton.primaryButton(
              onButtonPressed: () {
                Get.to(() => OnboardingScreen2(),
                    transition: transition, duration: transDuration);
              },
              title: "Continue"),
        ),
      ),
    );
  }
}
