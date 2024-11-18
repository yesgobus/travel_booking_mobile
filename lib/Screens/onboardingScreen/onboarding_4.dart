import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/config/routes/app_routes.dart';
import 'package:travel_booking/utils/appcolors/app_colors.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/buttons/button.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

class OnboardingScreen4 extends StatefulWidget {
  const OnboardingScreen4({super.key});

  @override
  State<OnboardingScreen4> createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PngAssetPath.onboard4), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                height: Get.height, width: Get.width, color: AppColors.black65),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                      text: "Explore the world never easy life now.",
                      maxLine: 2,
                      align: TextAlign.center,
                      textSize: 26,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 18),
                  AppButton.primaryButton(
                      onButtonPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      title: "Sign in"),
                  SizedBox(height: 18),
                  AppButton.outlineButton(
                      onButtonPressed: () {
                        Get.toNamed(AppRoutes.signup);
                      },
                      title: "Sign up"),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
