import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Screens/onboardingScreen/onboarding_4.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../config/routes/app_pages.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PngAssetPath.onboard3), fit: BoxFit.cover)),
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
                          text: "World Is Waiting ",
                          color: AppColors.whiteColor,
                          textSize: 20,
                          fontWeight: FontWeight.w500),
                      TextWidget(
                          text: "For You",
                          textSize: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextWidget(
                    text:
                        "Yes Exactly! Get hold of your passport and begin your adventure.",
                    textSize: 14,
                    color: AppColors.whiteColor,
                    maxLine: 5,
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
                    child: AppButton.primaryButton(
                        onButtonPressed: () {
                          Get.to(() => OnboardingScreen4(),transition: transition, duration: transDuration);
                        },
                        title: "Let’s Get Started"),
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
