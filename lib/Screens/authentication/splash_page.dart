import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_booking/Screens/01BUSAPP/busapp_view.dart';
import 'package:travel_booking/Screens/onboardingScreen/onboarding_1.dart';
import 'package:travel_booking/utils/constant/png_asset_constant.dart';
import 'package:travel_booking/widget/textwidget/text_widget.dart';

import '../../config/routes/app_routes.dart';
import '../../utils/getStore/get_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    navigateToLogin();
    super.initState();
  }

  void navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      // if (GetStoreData.getStore.read('access_token') == null) {
      //   Get.offAll(() => const OnboardingScreen1());
      // } else {
      //   log(GetStoreData.getStore.read('access_token').toString());
      Get.offAll(LandingBusAppScreen());
      // }
    });
  }


//satya
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.orange[900], // Set the background color to orange
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                PngAssetPath.splashLogo,
                height: 110,
                width: 170,
              ),
              /*TextWidget(
                text: "",
                textSize: 16,
                fontWeight: FontWeight.w500,
              ),*/
            ],
          ),
        ),
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(PngAssetPath.bgImg))),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  PngAssetPath.splashLogo,
                  height: 110,
                  width: 170,
                ),
                TextWidget(text: "Welcome To YesGo Bus", textSize:16,fontWeight: FontWeight.w500,),
              ],
            )),
      ),
    );
  }
*/
}
