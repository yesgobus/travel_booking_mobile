import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../config/routes/app_pages.dart';
import 'onboarding_3.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PngAssetPath.onboard2), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                height: Get.height, width: Get.width, color: AppColors.black65),
            Center(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 22),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                          text: "Plan Your Own ",
                          color: AppColors.whiteColor,
                          textSize: 20,
                          fontWeight: FontWeight.w500),
                      TextWidget(
                          text: "Journey",
                          textSize: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextWidget(
                    text:
                        "Plan your own journey with our travel planning app! Discover new destinations, create itineraries, and make unforgettable memories.",
                    textSize: 14,
                    color: AppColors.whiteColor,
                    maxLine: 5,
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
                    child: AppButton.primaryButton(
                        onButtonPressed: () {
                          Get.to(() => OnboardingScreen3(),transition: transition, duration: transDuration);
                        },
                        title: "Continue"),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
